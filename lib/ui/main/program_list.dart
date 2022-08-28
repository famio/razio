part of 'main_page.dart';

final _isReadyProvider = StateProvider.autoDispose.family<bool, String>(
  (ref, arg) => false,
);

class _ProgramList extends ConsumerWidget {
  const _ProgramList({required this.stationId});
  static final dateFormat = DateFormat.Hm();
  final String stationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programList = ref.watch(programListProvider(stationId));
    final controller = ItemScrollController();
    final isReady = ref.watch(_isReadyProvider(stationId));

    final itemPositionsListener = ItemPositionsListener.create();

    ref.listen<AsyncValue<Program?>>(nowOnAirProgramProvider(stationId),
        (previous, next) async {
      if (!isReady) {
        return;
      }
      next.whenData((program) {
        if (program == null) {
          return;
        }
        if (previous?.value?.id == program.id) {
          return;
        }
        final programs = programList.value;
        if (programs == null) {
          return;
        }
        final index = programs
            .map((e) => e.startTime)
            .toList()
            .indexOf(program.startTime);
        if (index == -1) {
          return;
        }
        final resultIndex =
            index + 1 >= programs.length - 1 ? index : index + 1;
        controller.scrollTo(
          index: resultIndex,
          duration: const Duration(milliseconds: 200),
        );
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!controller.isAttached) {
        return;
      }
      final program = await ref.read(nowOnAirProgramProvider(stationId).future);
      if (program == null) {
        ref.read(_isReadyProvider(stationId).notifier).state = true;
        return;
      }
      final programs = await ref.read(programListProvider(stationId).future);
      final index = programs
          .indexWhere((element) => element.startTime == program.startTime);
      if (index == -1) {
        return;
      }
      final resultIndex = index + 1 >= programs.length - 1 ? index : index + 1;
      controller.jumpTo(index: resultIndex);
      ref.read(_isReadyProvider(stationId).notifier).state = true;
    });

    return programList.when(
      data: (data) {
        return Opacity(
          opacity: isReady ? 1 : 0,
          child: ScrollablePositionedList.separated(
            itemScrollController: controller,
            itemPositionsListener: itemPositionsListener,
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
            },
          ),
        );
      },
      error: (error, trace) => const Text('error'),
      loading: () => const Text(''),
    );
  }
}
