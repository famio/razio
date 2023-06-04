part of 'main_page.dart';

class _BackGround extends ConsumerWidget {
  const _BackGround();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final baseWidth = constraints.maxWidth;
        final baseHeight = constraints.maxHeight;
        return SizedBox.expand(
          child: Blur(
            blur: 30,
            colorOpacity: 0,
            child: Stack(
              children: [
                _BackgroundCircle(baseWidth, baseHeight, 0),
                _BackgroundCircle(baseWidth, baseHeight, 1),
                _BackgroundCircle(baseWidth, baseHeight, 2),
                _BackgroundCircle(baseWidth, baseHeight, 3),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BackgroundCircle extends ConsumerWidget {
  const _BackgroundCircle(
    this.baseWidth,
    this.baseHeight,
    this.index,
  );

  final double baseWidth;
  final double baseHeight;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const circleSize = 180.0;
    const circleHalfSize = circleSize / 2;
    final parameters = ref.watch(_animationProvider(index));
    return Positioned(
      top: parameters.position.dy * baseHeight - circleHalfSize,
      left: parameters.position.dx * baseWidth - circleHalfSize,
      child: RepaintBoundary(
        child: AnimatedOpacity(
          opacity: parameters.opacity,
          duration: const Duration(seconds: 2),
          child: const SizedBox.square(
            dimension: circleSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x6BFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final _animationProvider =
    Provider.family<BackgroundCircleParameters, int>((ref, index) {
  const maxOpacity = 0.6;

  void changePosition() {
    ref.state = ref.state.copyWith(
      position: Offset(
        Random().nextDouble(),
        Random().nextDouble(),
      ),
    );
  }

  void changeOpacity() {
    ref.state = ref.state.copyWith(opacity: maxOpacity);
    Timer(Duration(seconds: 10 + Random().nextInt(5)), () {
      ref.state = ref.state.copyWith(opacity: 0);
      Timer(const Duration(seconds: 3), () {
        changePosition();
        changeOpacity();
      });
    });
  }

  Timer(const Duration(milliseconds: 1000), changeOpacity);

  return BackgroundCircleParameters(
    opacity: 0,
    position: Offset(
      Random().nextDouble(),
      Random().nextDouble(),
    ),
  );
});
