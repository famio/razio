part of 'main_page.dart';

class _PlayController extends ConsumerWidget {
  const _PlayController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    final selectedProgram = ref.watch(selectedStationOnAirProgramProvider);
    final _ = ref.read(audioPlayerProvier);
    return SafeArea(
      child: Row(children: [
        const SizedBox(width: 8),
        InkWell(
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 50,
            ),
            onTap: () {
              ref.read(isPlayingProvider.notifier).state ^= true;
            }),
        const SizedBox(width: 8),
        Text(
          selectedProgram.maybeWhen(
              data: (data) => data == null ? '' : data.title, orElse: () => ''),
          style: const TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
