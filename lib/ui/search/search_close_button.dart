part of 'search_page.dart';

class _CloseButton extends ConsumerWidget {
  const _CloseButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Bouncing(
      child: SizedBox(
        width: size,
        height: size,
        child: const Icon(
          Icons.close,
          size: 28,
        ),
      ),
      onPress: () => context.pop(),
    );
  }
}
