import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
  const Bouncing({
    super.key,
    this.scale = 0.9,
    required this.child,
    required this.onPress,
  });
  final double scale;
  final Widget child;
  final VoidCallback onPress;

  @override
  State<Bouncing> createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      upperBound: 1.0 - widget.scale,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
        widget.onPress();
      },
      child: Transform.scale(
        scale: 1.0 - _controller.value,
        child: widget.child,
      ),
    );
  }
}
