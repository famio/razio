part of 'main_page.dart';

class _ProgramList extends ConsumerWidget {
  const _ProgramList({
    required this.shouldShowEmptyItem,
    required this.programs,
    required this.itemHeight,
  });

  final bool shouldShowEmptyItem;
  final List<MainPageListItem> programs;
  final double itemHeight;

  int get _itemCount =>
      shouldShowEmptyItem ? programs.length + 1 : programs.length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = FixedExtentScrollController();

    PageStorageKey<String>? pageStorageKey(MainPageListMode listMode) {
      switch (listMode) {
        case MainPageListMode.live:
          return const PageStorageKey('live_program_list');
        case MainPageListMode.search:
          return null;
      }
    }

    return NotificationListener<ScrollNotification>(
      child: ClickableListWheelScrollView(
        key: pageStorageKey(ref.read(mainPageListModeProvider)),
        scrollController: scrollController,
        itemHeight: itemHeight,
        itemCount: _itemCount,
        onItemTapCallback: (index) {
          ref.read(mainPageActionProvider.notifier).onItemTapCallback(index);
        },
        child: ListWheelScrollView.useDelegate(
          controller: scrollController,
          itemExtent: itemHeight,
          physics: const FixedExtentScrollPhysics(),
          // overAndUnderCenterOpacity: 0.8,
          diameterRatio: 100,
          onSelectedItemChanged: (value) {
            ref
                .read(mainPageActionProvider.notifier)
                .onSelectedItemChanged(value);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              if (index == 0 && shouldShowEmptyItem) {
                return const SizedBox();
              } else {
                final fixedIndex = shouldShowEmptyItem ? index - 1 : index;
                final program = programs[fixedIndex];
                return _ProgramListItem(item: program);
              }
            },
            childCount: _itemCount,
          ),
        ),
      ),
    );
  }
}

class _ProgramListItem extends ConsumerWidget {
  const _ProgramListItem({required this.item});

  final MainPageListItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemInnerPadding = 8.0;
    return Padding(
      padding: const EdgeInsets.all(itemInnerPadding),
      child: Row(
        key: ValueKey(item.key),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: double.infinity,
              child: AspectRatio(
                aspectRatio: 48 / 30,
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  errorWidget: (context, url, dynamic error) =>
                      const Icon(Icons.error),
                  fadeOutDuration: Duration.zero,
                  fadeInDuration: Duration.zero,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.info1,
                  style: AppTextStyle.bodySmall(context).copyWith(height: 1.3),
                  maxLines: 1,
                ),
                Text(
                  item.info2,
                  style: AppTextStyle.bodySmall(context).copyWith(height: 1.3),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                Flexible(
                  // flex: 2,
                  fit: FlexFit.tight,
                  child: Text(
                    item.title,
                    style:
                        AppTextStyle.body(context).bold.copyWith(height: 1.5),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
