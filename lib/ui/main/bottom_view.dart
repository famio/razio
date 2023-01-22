part of 'main_page.dart';

class _BottomView extends ConsumerWidget {
  const _BottomView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 50.0;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _PlayButton(size: iconSize),
            ],
          ),
        ),
        SizedBox(
          height: ref.read(nativeSafeAreaProvider.notifier).state.bottom,
        ),
      ],
    );
  }
}
