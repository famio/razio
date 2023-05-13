part of 'main_page.dart';

class _SearchBackground extends ConsumerWidget {
  const _SearchBackground();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      key: GlobalKey(),
      visible: ref.watch(searchEditingProvider),
      child: ColoredBox(
        color: AppColor.background(context).withOpacity(0.8),
        child: const SizedBox.expand(),
      ),
    );
  }
}
