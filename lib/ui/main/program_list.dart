part of 'main_page.dart';

class _ProgramList extends ConsumerWidget {
  const _ProgramList({Key? key}) : super(key: key);

  static final dateFormat = DateFormat.jm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programList = ref.watch(selectedStationTodaysProgramListProvider);
    return programList.when(
        data: (data) {
          if (data == null) {
            return const Text('null');
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${dateFormat.format(data[index].startDate)} ~',
                            style: const TextStyle(color: Colors.black87),
                          ),
                          Text(
                            data[index].title,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                );
              },
            );
          }
        },
        error: (error, trace) => const Text('error'),
        loading: () => const Text('loading'));
  }
}
