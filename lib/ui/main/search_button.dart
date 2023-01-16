part of 'main_page.dart';

class _SearchButton extends ConsumerWidget {
  const _SearchButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Bouncing(
      child: SizedBox(
        width: size,
        height: size,
        child: const Icon(
          Icons.search,
          size: 28,
        ),
      ),
      onPress: () {
        print('hoge');
      },
    );
  }
}
