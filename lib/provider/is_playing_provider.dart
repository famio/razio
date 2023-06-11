import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:razio/provider/audio_player_provider.dart';

final isPlayingProvider = StreamProvider<bool>((ref) {
  return audioPlayer.playerStateStream.map((event) => event.playing);
});
