part of 'main_page.dart';

class _ProgramList extends ConsumerWidget {
  const _ProgramList({
    required this.programs,
    required this.listMode,
    required this.itemHeight,
  });

  final List<MainPageListItem> programs;
  final MainPageListMode listMode;
  final double itemHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = FixedExtentScrollController();
    final itemCount = programs.length;

    PageStorageKey<String>? pageStorageKey() {
      switch (listMode) {
        case MainPageListMode.live:
          return const PageStorageKey('live_program_list');
        case MainPageListMode.search:
          return null;
      }
    }

    return NotificationListener<ScrollNotification>(
      child: ClickableListWheelScrollView(
        key: pageStorageKey(),
        scrollController: scrollController,
        itemHeight: itemHeight,
        itemCount: itemCount,
        onItemTapCallback: (index) {
          ref.read(mainPageActionProvider.notifier).onItemTapCallback(index);
        },
        child: ListWheelScrollView.useDelegate(
          controller: scrollController,
          itemExtent: itemHeight,
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: 100,
          onSelectedItemChanged: (value) {
            ref
                .read(mainPageActionProvider.notifier)
                .onSelectedItemChanged(value);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              final program = programs[index];
              final opacity =
                  listMode == MainPageListMode.search && index == 0 ? 0.5 : 1.0;
              return Opacity(
                opacity: opacity,
                child: _ProgramListItem(item: program),
              );
            },
            childCount: itemCount,
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
                  style: AppTextStyle.bodySmall(context)
                      .secondary(context)
                      .copyWith(height: 1.3),
                  maxLines: 1,
                ),
                Text(
                  item.info2,
                  style: AppTextStyle.bodySmall(context)
                      .secondary(context)
                      .copyWith(height: 1.3),
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
