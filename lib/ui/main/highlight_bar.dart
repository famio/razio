part of 'main_page.dart';

class _HighlightBar extends StatelessWidget {
  const _HighlightBar({required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.highlightBar(context),
      child: SizedBox(
        width: double.infinity,
        height: height,
      ),
    );
  }
}
