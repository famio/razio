part of 'main_page.dart';

class _PlayController extends ConsumerWidget {
  const _PlayController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    return Row(children: [
      InkWell(
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 50,
          ),
          onTap: () {
            ref.read(isPlayingProvider.notifier).state ^= true;
            if (audioPlayer.playing) {
              audioPlayer.pause();
            } else {
              final asyncurl = ref.read(selectedStationStreamUrlProvider);
              print('async url:${asyncurl}');
              asyncurl.whenData((url) {
                print('url:${url}');
                if (url == null) return;
                ref.read(authProvider).whenData((authinfo) {
                  final Map<String, String> header = {
                    "X-Radiko-Authtoken": authinfo.authToken
                  };
                  audioPlayer.setUrl(url, headers: header);
                  audioPlayer.play();
                });
              });
            }
          })
    ]);
  }
}
