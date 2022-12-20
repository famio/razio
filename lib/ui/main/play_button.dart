part of 'main_page.dart';

class _PlayButton extends ConsumerWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    return Bouncing(
      child: SimpleShadow(
        opacity: 0.3,
        color: AppColor.accent,
        offset: const Offset(0, 8),
        sigma: 5,
        child: Stack(
          children: [
            const SizedBox(
              width: 60,
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            isPlaying
                ? Assets.images.iconStop.svg(width: 60, color: AppColor.accent)
                : Assets.images.iconPlay.svg(width: 60, color: AppColor.accent),
          ],
        ),
      ),
      onPress: () => ref.read(isPlayingProvider.notifier).state ^= true,
    );
  }
}
