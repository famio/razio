part of 'main_page.dart';

class _HighlightBar extends StatelessWidget {
  const _HighlightBar({required this.height});

  final double height;
  double get blur => 20;

  @override
  Widget build(BuildContext context) {
    return Blur(
      colorOpacity: 0.13,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: double.infinity,
        height: height,
      ),
    );
  }
}
