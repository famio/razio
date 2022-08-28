part of 'main_page.dart';

class _PlayController extends ConsumerWidget {
  const _PlayController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    final selectedProgram = ref.watch(selectedStationOnAirProgramProvider);
    ref.read(audioPlayerProvier);

    return SafeArea(
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              const SizedBox(width: 8),
              InkWell(
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                ),
                onTap: () {
                  ref.read(isPlayingProvider.notifier).state ^= true;
                },
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  selectedProgram.maybeWhen(
                    data: (data) => data == null ? '' : data.title,
                    orElse: () => '',
                  ),
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
