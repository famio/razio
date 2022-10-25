import 'package:audio_service/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/play_controller_provider.dart';
import 'package:fudiko/provider/selected_station_on_air_program_provider.dart';
import 'package:fudiko/provider/selected_station_provider.dart';
import 'package:fudiko/provider/selected_station_stream_url_provider.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayer = AudioPlayer();
final audioPlayerProvier = Provider((ref) {
  final selectedStation = ref.watch(selectedStationProvider);
  final selectedProgram = ref.watch(selectedStationOnAirProgramProvider);
  ref
    ..listen<AsyncValue<String?>>(selectedStationStreamUrlProvider,
        (previous, next) {
      next.when(
        data: (data) async {
          if (data == null) {
            return;
          }
          ref.read(authProvider).whenData((authInfo) async {
            final header = <String, String>{
              'X-Radiko-Authtoken': authInfo.authToken,
            };
            await audioPlayer.setAudioSource(
              AudioSource.uri(
                Uri.parse(data),
                headers: header,
                tag: MediaItem(
                  id: selectedProgram == null ? '' : selectedProgram.id,
                  album: selectedStation == null ? '' : selectedStation.name,
                  title: selectedProgram == null ? '' : selectedProgram.title,
                  artUri: selectedProgram == null
                      ? null
                      : Uri.parse(selectedProgram.img),
                ),
              ),
            );
            if (ref.read(isPlayingProvider) && !audioPlayer.playing) {
              await audioPlayer.play();
            }
          });
        },
        error: (error, trace) {},
        loading: () {},
      );
    })
    ..listen<bool>(isPlayingProvider, (previous, next) async {
      if (next) {
        ref.read(selectedStationStreamUrlProvider).whenData((value) async {
          if (value == null) {
            return;
          }
          await audioPlayer.play();
        });
      } else {
        await audioPlayer.stop();
      }
    });
});
