part of 'main_page.dart';

class _PlayButton extends ConsumerWidget {
  const _PlayButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    return Bouncing(
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          isPlaying.value == true ? Icons.pause : Icons.play_arrow,
          size: 50,
        ),
      ),
      onPress: () {
        ref.read(mainPageActionProvider.notifier).onPlayButton();
      },
    );
  }
}
