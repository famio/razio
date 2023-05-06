part of 'main_page.dart';

class _PlayButton extends ConsumerWidget {
  const _PlayButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    final icon = isPlaying.value == true
        ? Assets.images.iconPause
        : Assets.images.iconPlay;
    return Bouncing(
      child: icon.svg(
        colorFilter: ColorFilter.mode(
          AppColor.icon(context),
          BlendMode.srcIn,
        ),
      ),
      onPress: () => ref.read(mainPageActionProvider.notifier).onPlayButton(),
    );
  }
}
