part of 'main_page.dart';

class _ProgramThumbnail extends ConsumerWidget {
  const _ProgramThumbnail({Key? key, required this.stationId})
      : super(key: key);

  final String stationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final program = ref.watch(nowOnAirProgramProvider(stationId));
    return AspectRatio(
      aspectRatio: 48 / 30,
      child: program.when(
        data: (program) {
          if (program == null) {
            return const ColoredBox(
              color: Colors.transparent,
            );
          } else {
            return CachedNetworkImage(
              imageUrl: program.img,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fadeOutDuration: const Duration(seconds: 0),
              fadeInDuration: const Duration(seconds: 0),
            );
          }
        },
        error: (error, trace) => const Icon(
          Icons.error,
        ),
        loading: () => const ColoredBox(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
