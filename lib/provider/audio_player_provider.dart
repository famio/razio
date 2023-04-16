import 'package:audio_service/audio_service.dart';
import 'package:fudiko/const.dart';
import 'package:fudiko/entity/search.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/main_page_list_mode_provider.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/selected_search_program_provider.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:fudiko/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayer = AudioPlayer();

final audioPlayerProvier = Provider((ref) {
  ref
    ..listen<String?>(selectedLiveStationIdProvider, (previous, next) {
      if (next == null) {
        return;
      }
      ref
          .read(audioSourceFromStationIdProvider(next).future)
          .then(audioPlayer.setAudioSource);
    })
    ..listen<SearchProgram?>(selectedSearchProgramProvider, (previous, next) {
      if (next == null) {
        return;
      }
      final audioSource = ref.read(audioSourceFromSearchProgramProvider(next));
      audioPlayer.setAudioSource(audioSource);
    })
    ..listen(mainPageListModeProvider, (previous, next) {
      // SearchモードからLiveモードに帰ってきた時に、選択していたStationを再度再生する
      if (previous == MainPageListMode.search &&
          next == MainPageListMode.live) {
        final stationId = ref.read(selectedLiveStationIdProvider);
        if (stationId == null) {
          return;
        }
        ref
            .read(audioSourceFromStationIdProvider(stationId).future)
            .then(audioPlayer.setAudioSource);
      }
    });
});

final audioSourceFromStationIdProvider = FutureProvider.autoDispose
    .family<AudioSource, String>((ref, stationId) async {
  final requestUrl = Uri.parse(
    'http://f-radiko.smartstream.ne.jp/$stationId/_definst_/simul-stream.stream/playlist.m3u8',
  );
  final authInfo = ref.read(authProvider).value;
  if (authInfo == null) {
    throw Exception('authInfo is null');
  }
  final header = <String, String>{
    HeaderKey.authtoken.value: authInfo.authToken,
  };
  final request = http.Request('get', requestUrl);
  request.headers.clear();
  request.headers.addAll(header);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to StreamUrlRequest');
  }
  final body = await response.stream.bytesToString();
  final reg = RegExp(r'^https?://.+m3u8$', multiLine: true);
  final streamUrl = reg.firstMatch(body)!.group(0);

  final programlist = await ref.read(nowOnAirProgramListProvider.future);
  final program =
      programlist.firstWhere((element) => element.stationId == stationId);

  return AudioSource.uri(
    Uri.parse(streamUrl!),
    headers: header,
    tag: MediaItem(
      id: program.title + program.startTime,
      album: program.stationId,
      title: program.title,
      artUri: Uri.parse(program.img),
    ),
  );
});

final audioSourceFromSearchProgramProvider =
    Provider.autoDispose.family<AudioSource, SearchProgram>((ref, program) {
  final authInfo = ref.read(authProvider).value;
  if (authInfo == null) {
    throw Exception('authInfo is null');
  }
  final header = <String, String>{
    HeaderKey.authtoken.value: authInfo.authToken,
  };
  final outputFormat = DateFormat('yyyyMMddHHmmss');
  final startAt = outputFormat.format(program.startTime);
  final endAt = outputFormat.format(program.endTime);
  final url = Uri.https(
    'tf-f-rpaa-radiko.smartstream.ne.jp',
    '/tf/playlist.m3u8',
    <String, dynamic>{
      'station_id': program.stationId,
      'start_at': startAt,
      'ft': startAt,
      'end_at': endAt,
      'to': endAt,
      'l': '15',
      'lsid': generateUid(),
      'type': 'b'
    },
  );
  return AudioSource.uri(
    url,
    headers: header,
    tag: MediaItem(
      id: program.title + program.startTime.toString(),
      album: program.stationId,
      title: program.title,
      artUri: program.img,
    ),
  );
});
