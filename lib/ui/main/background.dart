part of 'main_page.dart';

class _BackGround extends StatefulWidget {
  const _BackGround();

  static const double _spawnMaxRadius = 150;

  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<_BackGround>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return OverflowClipping(
      minWidth:
          MediaQuery.of(context).size.width + _BackGround._spawnMaxRadius * 2,
      minHeight:
          MediaQuery.of(context).size.height + _BackGround._spawnMaxRadius * 2,
      child: Transform.translate(
        offset: const Offset(
          -_BackGround._spawnMaxRadius,
          -_BackGround._spawnMaxRadius,
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              baseColor: Colors.white,
              spawnMinSpeed: 10,
              spawnMaxSpeed: 20,
              spawnMinRadius: 50,
              spawnMaxRadius: _BackGround._spawnMaxRadius,
              minOpacity: 0.2,
              opacityChangeRate: 0.1,
              particleCount: 8,
            ),
          ),
          vsync: this,
          child: const Blur(
            blur: 30,
            colorOpacity: 0,
            child: SizedBox(),
          ),
        ),
      ),
    );
  }
}

@immutable
class OverflowClipping extends SingleChildRenderObjectWidget {
  const OverflowClipping({
    required Widget super.child,
    this.minWidth = 240,
    this.minHeight = 240,
    super.key,
  });

  final double minWidth;
  final double minHeight;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderOverflowClipping(
      minWidth: minWidth,
      minHeight: minHeight,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderOverflowClipping renderObject,
  ) {
    renderObject
      ..minWidth = minWidth
      ..minHeight = minHeight;
  }
}

class RenderOverflowClipping extends RenderProxyBox {
  RenderOverflowClipping({
    required double minWidth,
    required double minHeight,
  })  : _minWidth = minWidth,
        _minHeight = minHeight;

  double _minWidth;
  double get minWidth => _minWidth;
  set minWidth(double newValue) {
    if (_minWidth == newValue) {
      return;
    }
    _minWidth = newValue;
    markNeedsLayout();
  }

  double _minHeight;
  double get minHeight => _minHeight;
  set minHeight(double newValue) {
    if (_minHeight == newValue) {
      return;
    }
    _minHeight = newValue;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final child = this.child;
    if (child == null) {
      return super.performLayout();
    }

    size = constraints.biggest;

    child.layout(
      BoxConstraints.tightFor(
        width: max(minWidth, constraints.maxWidth),
        height: max(minHeight, constraints.maxHeight),
      ),
    );
  }

  final _clipRectLayer = LayerHandle<ClipRectLayer>();

  @override
  void paint(PaintingContext context, Offset offset) {
    final child = this.child;
    if (child != null) {
      _clipRectLayer.layer = context.pushClipRect(
        needsCompositing,
        offset,
        Offset.zero & size,
        super.paint,
        oldLayer: _clipRectLayer.layer,
      );
    }
  }
}
