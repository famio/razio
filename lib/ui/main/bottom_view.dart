part of 'main_page.dart';

class _BottomView extends ConsumerWidget {
  const _BottomView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 50.0;
    return SafeArea(
      left: false,
      top: false,
      right: false,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _SearchButton(
              size: iconSize,
            ),
            _PlayButton(
              size: iconSize,
            ),
            _SearchButton(
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}