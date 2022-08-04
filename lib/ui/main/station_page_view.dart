part of 'main_page.dart';

class _StationPageView extends ConsumerWidget {
  const _StationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(pageViewControllerProvider);
    final stations = ref.watch(stationListProvider);

    return stations.maybeWhen(
      orElse: () => const Text(''),
      data: (data) {
        return PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            ref.read(selectedStationIdProvider.notifier).state = data[index].id;
          },
          itemCount: data.length,
          itemBuilder: (context, index) {
            final station = data[index];
            return Column(
              children: [
                _ProgramThumbnail(
                  stationId: station.id,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: _ProgramList(
                    stationId: station.id,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
