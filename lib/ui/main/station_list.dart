part of 'main_page.dart';

final _controller = ItemScrollController();

const _textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class _StationList extends ConsumerWidget {
  const _StationList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String?>(selectedStationIdProvider, (previous, next) {
      if (next == null) {
        return;
      }
      final stations = ref.read(stationListProvider).value;
      if (stations == null) {
        return;
      }
      final index = stations.map((e) => e.id).toList().indexOf(next);
      final textSize = _textSize(stations[index].name, _textStyle);
      final screenSize = MediaQuery.of(context).size;
      _controller.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.5 - textSize.width / screenSize.width / 2,
      );
    });

    final stations = ref.watch(stationListProvider);

    return stations.maybeWhen(
      orElse: () => const Text(''),
      data: (data) {
        return SizedBox(
          height: 50,
          child: ScrollablePositionedList.separated(
            itemScrollController: _controller,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => Center(
              child: GestureDetector(
                child: Text(
                  data[index].name,
                  style: _textStyle.copyWith(
                    color:
                        data[index].id == ref.watch(selectedStationIdProvider)
                            ? Colors.black
                            : Colors.grey,
                  ),
                ),
                onTap: () {
                  ref.read(pageViewControllerProvider).jumpToPage(
                        index,
                      );
                },
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 16,
            ),
            itemCount: data.length,
          ),
        );
      },
    );
  }
}

Size _textSize(String text, TextStyle style) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: ui.TextDirection.ltr,
  )..layout();
  return textPainter.size;
}
