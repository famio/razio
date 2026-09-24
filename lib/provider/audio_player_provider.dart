import 'package:audio_service/audio_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:razio/const.dart';
import 'package:razio/entity/search.dart';
import 'package:razio/provider/auth_provider.dart';
import 'package:razio/provider/main_page_list_mode_provider.dart';
import 'package:razio/provider/now_on_air_program_list.dart';
import 'package:razio/provider/playback_timeline_provider.dart';
import 'package:razio/provider/selected_search_program_provider.dart';
import 'package:razio/provider/selected_station_id_provider.dart';
import 'package:razio/util.dart';

final audioPlayer = AudioPlayer();

final Provider<Null> audioPlayerProvier = Provider((ref) {
  ref
    ..listen<String?>(selectedLiveStationIdProvider, (previous, next) {
      if (next == null) {
        return;
      }
      ref.read(playbackTimelineProvider.notifier).loadLive(next);
    })
    ..listen<SearchProgram?>(selectedSearchProgramProvider, (previous, next) {
      if (next == null) {
        return;
      }
      ref.read(playbackTimelineProvider.notifier).loadSearchProgram(next);
    })
    ..listen(mainPageListModeProvider, (previous, next) {
      // Search・FavoriteモードからLiveモードに帰ってきた時に、選択していたStationを再度再生する
      if (previous != MainPageListMode.live && next == MainPageListMode.live) {
        // selectedSearchProgramProviderがnull = すでにLive放送を再生中
        if (ref.read(selectedSearchProgramProvider.notifier).state == null) {
          return;
        }
        final stationId = ref.read(selectedLiveStationIdProvider);
        if (stationId == null) {
          return;
        }
        ref.read(playbackTimelineProvider.notifier).loadLive(stationId);
      }
    });
});

/// Live放送のAudioSource
/// windowSecondsを指定すると、その秒数だけ遡った位置から再生される(15〜300秒)
final AutoDisposeFutureProviderFamily<AudioSource,
        ({String stationId, int windowSeconds})>
    audioSourceFromStationIdProvider = FutureProvider.autoDispose
        .family<AudioSource, ({String stationId, int windowSeconds})>(
            (ref, arg) async {
  final (:stationId, :windowSeconds) = arg;
  final requestUrl = Uri.https(
    'si-f-radiko.smartstream.ne.jp',
    '/so/playlist.m3u8',
    <String, dynamic>{
      'station_id': stationId,
      'l': windowSeconds.toString(),
      'lsid': generateUid(),
      'type': 'b',
    },
  );
  final authInfo = ref.read(authProvider).value;
  if (authInfo == null) {
    throw Exception('authInfo is null');
  }
  final header = <String, String>{
    HeaderKey.authtoken.value: authInfo.authToken,
    HeaderKey.areaId.value: authInfo.areaId,
  };
  final request = http.Request('get', requestUrl);
  request.headers.clear();
  request.headers.addAll(header);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to StreamUrlRequest');
  }
  final body = await response.stream.bytesToString();
  final reg = RegExp(r'^https?://.*medialist.*$', multiLine: true);
  final streamUrl = reg.firstMatch(body)!.group(0)!;
  final addedUnixTimeStreamUrl =
      '$streamUrl&_=${DateTime.now().millisecondsSinceEpoch}';

  final programlist = await ref.read(nowOnAirProgramListProvider.future);
  final program =
      programlist.firstWhere((element) => element.stationId == stationId);
  final stationName = program.stationName;
  return AudioSource.uri(
    Uri.parse(addedUnixTimeStreamUrl),
    tag: MediaItem(
      id: program.title + program.startTime,
      artist: stationName,
      title: program.title,
      artUri: Uri.parse(program.img),
    ),
  );
});
