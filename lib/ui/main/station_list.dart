part of 'main_page.dart';

class _StationList extends ConsumerWidget {
  const _StationList(this.stations, {Key? key}) : super(key: key);
  final List<Station> stations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => Center(
          child: GestureDetector(
            child: Text(
              stations[index].name,
              style: TextStyle(
                color:
                    stations[index].id == ref.watch(selectedStationIdProvider)
                        ? Colors.black
                        : Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => ref.read(selectedStationIdProvider.notifier).state =
                stations[index].id,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        itemCount: stations.length,
      ),
    );
  }
}
