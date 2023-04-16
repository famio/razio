import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isPlayingProvider = StreamProvider<bool>((ref) {
  return audioPlayer.playerStateStream.map((event) => event.playing);
});
