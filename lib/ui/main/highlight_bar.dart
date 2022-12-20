part of 'main_page.dart';

class _HighlightBar extends StatelessWidget {
  const _HighlightBar({required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: AppColor.highlightGradient(context),
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
    );
  }
}
