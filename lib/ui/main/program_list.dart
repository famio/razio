part of 'main_page.dart';

final _controller = ItemScrollController();
final _itemPositionsListener = ItemPositionsListener.create();
int? _pendingIndex;

final _isReadyProvider = StateProvider<bool>(((ref) => false));

class _ProgramList extends ConsumerWidget {
  const _ProgramList({Key? key}) : super(key: key);
  static final dateFormat = DateFormat.Hm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<Program?>>(selectedStationOnAirProgramProvider,
        (previous, next) async {
      next.whenData((program) async {
        ref.read(_isReadyProvider.notifier).state = false;
        if (program == null) return;
        final programs =
            await ref.read(selectedStationTodaysProgramListProvider.future);
        if (programs == null) return;
        final index = programs
            .indexWhere((element) => element.startTime == program.startTime);
        if (index == -1) return;
        final resultIndex =
            index + 1 >= programs.length - 1 ? index : index + 1;
        if (_controller.isAttached) {
          _controller.jumpTo(index: resultIndex);
          ref.read(_isReadyProvider.notifier).state = true;
        } else {
          _pendingIndex = resultIndex;
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_controller.isAttached) return;
      if (_pendingIndex == null) return;
      _controller.jumpTo(index: _pendingIndex!);
      _pendingIndex = null;
      ref.read(_isReadyProvider.notifier).state = true;
    });

    final programList = ref.watch(selectedStationTodaysProgramListProvider);
    return programList.when(
        data: (data) {
          if (data == null) {
            return const Text('null');
          } else {
            return Opacity(
              opacity: ref.watch(_isReadyProvider) ? 1 : 0,
              child: ScrollablePositionedList.separated(
                  itemScrollController: _controller,
                  itemPositionsListener: _itemPositionsListener,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 126 / 48 * 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              width: 126,
                              child: AspectRatio(
                                aspectRatio: 48 / 30,
                                child: CachedNetworkImage(
                                  imageUrl: data[index].img,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fadeOutDuration: const Duration(seconds: 0),
                                  fadeInDuration: const Duration(seconds: 0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${dateFormat.format(data[index].startDate)} ~',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    data[index].title,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      height: 1,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }
        },
        error: (error, trace) => const Text('error'),
        loading: () => const Text(''));
  }
}
