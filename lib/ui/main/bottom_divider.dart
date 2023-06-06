part of 'main_page.dart';

class _BottomDivider extends StatelessWidget {
  const _BottomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.divider(context),
        borderRadius: const BorderRadius.all(Radius.circular(1)),
      ),
      height: 2,
      width: double.infinity,
    );
  }
}
