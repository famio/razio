part of 'main_page.dart';

class _HighlightBar extends StatelessWidget {
  const _HighlightBar({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 4,
      blurColor: AppColor.highlightBar(context),
      colorOpacity: 0.13,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: SizedBox(
        width: double.infinity,
        height: height,
      ),
    );
  }
}
