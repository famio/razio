part of 'main_page.dart';

class _ProgramThumbnail extends ConsumerWidget {
  const _ProgramThumbnail({required this.stationId});

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
              errorWidget: (context, url, dynamic error) =>
                  const Icon(Icons.error),
              fadeOutDuration: Duration.zero,
              fadeInDuration: Duration.zero,
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
