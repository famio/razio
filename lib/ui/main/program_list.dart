part of 'main_page.dart';

class _ProgramList extends HookConsumerWidget {
  const _ProgramList({
    required this.programs,
    required this.listMode,
    required this.itemHeight,
  });

  final List<MainPageListItem> programs;
  final MainPageListMode listMode;
  final double itemHeight;

  /// 各アイテムの右端の★ボタンとして扱うタップ範囲の幅
  static const favoriteButtonWidth = 56.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = programs.length;
    final scrollController = useMemoized(
      () => FixedExtentScrollController(
        initialItem: listMode == MainPageListMode.live
            ? max(
                0,
                _selectedLiveStationIndex(
                    ref.read(selectedLiveStationIdProvider)))
            : 0,
      ),
    );
    useEffect(() => scrollController.dispose, [scrollController]);
    // ホイールはタップ位置の縦方向しか扱わないため、★ボタンの判定用に横方向の位置を記録する
    final lastTapX = useRef<double?>(null);

    // 通知のタップなどでLive放送の局が切り替わったら、その局の位置までスクロールする
    if (listMode == MainPageListMode.live) {
      ref.listen<String?>(selectedLiveStationIdProvider, (previous, next) {
        final index = _selectedLiveStationIndex(next);
        if (index < 0 ||
            !scrollController.hasClients ||
            scrollController.selectedItem == index) {
          return;
        }
        scrollController.jumpToItem(index);
      });
    }

    PageStorageKey<String>? pageStorageKey() {
      switch (listMode) {
        case MainPageListMode.live:
          return const PageStorageKey('live_program_list');
        case MainPageListMode.search:
        case MainPageListMode.favorite:
          return null;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) => Listener(
        onPointerDown: (event) => lastTapX.value = event.localPosition.dx,
        child: ClickableListWheelScrollView(
          key: pageStorageKey(),
          scrollController: scrollController,
          itemHeight: itemHeight,
          itemCount: itemCount,
          // ★ボタンのタップではスクロールさせないため、スクロールは自前で行う
          scrollOnTap: false,
          onItemTapCallback: (index) {
            final action = ref.read(mainPageActionProvider.notifier);
            final tapX = lastTapX.value;
            if (tapX != null &&
                tapX >= constraints.maxWidth - favoriteButtonWidth) {
              action.onFavoriteButton(programs[index]);
              return;
            }
            action.onItemTapCallback(index);
            scrollController.animateToItem(
              index,
              duration: const Duration(milliseconds: 600),
              curve: Curves.ease,
            );
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
                    listMode != MainPageListMode.live && index == 0 ? 0.5 : 1.0;
                return Opacity(
                  opacity: opacity,
                  child: _ProgramListItem(item: program),
                );
              },
              childCount: itemCount,
            ),
          ),
        ),
      ),
    );
  }

  int _selectedLiveStationIndex(String? stationId) {
    return programs.indexWhere((element) => element.stationId == stationId);
  }
}

/// お気に入り番組のタイムフリーで視聴可能な回のリスト
class _FavoriteProgramList extends ConsumerWidget {
  const _FavoriteProgramList({required this.itemHeight});

  final double itemHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFavorite = ref.watch(favoriteListProvider).isNotEmpty;
    final availablePrograms = ref.watch(favoriteAvailableProgramListProvider);

    final message = !hasFavorite
        ? const Text('番組の★をタップするとお気に入りに追加できます')
        : availablePrograms.when(
            data: (programs) =>
                programs.isEmpty ? const Text('聴ける番組はまだありません') : null,
            loading: () => const CircularProgressIndicator.adaptive(),
            error: (error, stackTrace) => const Text('読み込みに失敗しました'),
          );

    return Stack(
      children: [
        _ProgramList(
          programs: ref.watch(mainPageFavoriteListItemProvider),
          listMode: MainPageListMode.favorite,
          itemHeight: itemHeight,
        ),
        if (message != null)
          IgnorePointer(
            child: Align(
              alignment: const Alignment(0, 0.3),
              child: DefaultTextStyle.merge(
                style: AppTextStyle.bodySmall(context).secondary(context),
                child: message,
              ),
            ),
          ),
      ],
    );
  }
}

class _ProgramListItem extends ConsumerWidget {
  const _ProgramListItem({required this.item});

  final MainPageListItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemInnerPadding = 8.0;
    ref.watch(favoriteListProvider);
    final isFavorite = ref.read(favoriteListProvider.notifier).isFavorite(item);
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
          Expanded(
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
          SizedBox(
            width: _ProgramList.favoriteButtonWidth - itemInnerPadding,
            child: Center(
              child: Icon(
                isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                color: isFavorite ? AppColor.accent : AppColor.icon(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
