part of 'main_page.dart';

class _HighlightBar extends StatelessWidget {
  const _HighlightBar({required this.height});

  final double height;
  double get blur => 20;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColor.divider(context)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: blur,
            offset: const Offset(-5, -5),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: blur,
            offset: const Offset(5, 5),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black87.withOpacity(0.4),
            Colors.black87.withOpacity(0.2),
          ],
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: height,
      ),
    );
  }
}
