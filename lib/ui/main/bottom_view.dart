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
          child: Stack(
            alignment: Alignment.center,
            children: [
              const _PlayButton(size: iconSize),
              Positioned(
                right: 24,
                child: IconButton(
                  onPressed: () => ref
                      .read(mainPageActionProvider.notifier)
                      .onFavoriteModeButton(),
                  icon: Icon(
                    ref.watch(mainPageListModeProvider) ==
                            MainPageListMode.favorite
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    size: 30,
                    color: AppColor.icon(context),
                  ),
                ),
              ),
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
