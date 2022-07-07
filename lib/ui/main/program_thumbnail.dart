part of 'main_page.dart';

class _ProgramThumbnail extends ConsumerWidget {
  const _ProgramThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAirProgram = ref.watch(selectedStationOnAirProgramProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: AspectRatio(
        aspectRatio: 48 / 30,
        child: onAirProgram.when(
          data: (data) {
            if (data == null) {
              return const ColoredBox(
                color: Colors.transparent,
              );
            } else {
              return CachedNetworkImage(
                imageUrl: data.img,
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
        // child: ColoredBox(color: Colors.amber),
      ),
    );
    // return SliverToBoxAdapter(
    //   child: Padding(
    //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
    //     child: AspectRatio(
    //       aspectRatio: 48 / 30,
    //       child: onAirProgram.when(
    //         data: (data) {
    //           if (data == null) {
    //             return const ColoredBox(
    //               color: Colors.transparent,
    //             );
    //           } else {
    //             return CachedNetworkImage(
    //               imageUrl: data.img,
    //               errorWidget: (context, url, error) => const Icon(Icons.error),
    //               fadeOutDuration: const Duration(seconds: 0),
    //               fadeInDuration: const Duration(seconds: 0),
    //             );
    //           }
    //         },
    //         error: (error, trace) => const Icon(
    //           Icons.error,
    //         ),
    //         loading: () => const ColoredBox(
    //           color: Colors.transparent,
    //         ),
    //       ),
    //       // child: ColoredBox(color: Colors.amber),
    //     ),
    //   ),
    // );
  }
}
