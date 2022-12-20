part of 'main_page.dart';

class _ProgramList extends ConsumerWidget {
  const _ProgramList({
    required this.stationIds,
    required this.programs,
    required this.itemHeight,
  });

  final List<String> stationIds;
  final List<Program> programs;
  final double itemHeight;

  static final dateFormat = DateFormat.Hm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemInnerPadding = 8.0;
    final scrollController = FixedExtentScrollController();

    return NotificationListener<ScrollNotification>(
      child: ClickableListWheelScrollView(
        scrollController: scrollController,
        itemHeight: itemHeight,
        itemCount: programs.length,
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
                .onSelectedItemChanged(stationIds[value]);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              final program = programs[index];
              return Padding(
                padding: const EdgeInsets.all(itemInnerPadding),
                child: Row(
                  key: ValueKey(program.id),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 48 / 30,
                          child: CachedNetworkImage(
                            imageUrl: program.img,
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
                            ref.read(stationListProvider).value![index].name,
                            style: AppTextStyle.bodySmall(context)
                                .secondary(context)
                                .regular
                                .copyWith(height: 1.3),
                            maxLines: 1,
                          ),
                          Text(
                            // ignore: lines_longer_than_80_chars
                            '${dateFormat.format(program.startDate)} ~ ${dateFormat.format(program.endDate)}',
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
                              program.title,
                              style: AppTextStyle.body(context)
                                  .bold
                                  .copyWith(height: 1.5),
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
            },
            childCount: programs.length,
          ),
        ),
      ),
    );
  }
}
