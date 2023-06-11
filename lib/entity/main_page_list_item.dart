import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:razio/entity/program.dart';
import 'package:razio/entity/search.dart';

part 'main_page_list_item.freezed.dart';

@freezed
class MainPageListItem with _$MainPageListItem {
  factory MainPageListItem({
    required String imageUrl,
    required String title,
    required String info1,
    required String info2,
  }) = _MainPageListItem;

  factory MainPageListItem.fromProgram({
    required Program program,
  }) {
    return MainPageListItem(
      imageUrl: program.img,
      title: program.title,
      info1: program.stationName,
      info2:
          '${dateFormat.format(program.startDate)} ~ ${dateFormat.format(program.endDate)}', // ignore: lines_longer_than_80_chars
    );
  }

  factory MainPageListItem.fromSearchProgram({
    required SearchProgram program,
  }) {
    return MainPageListItem(
      imageUrl: program.img.toString(),
      title: program.title,
      info1: DateFormat.MEd('ja').format(program.startTime),
      info2:
          '${dateFormat.format(program.startTime)} ~ ${dateFormat.format(program.endTime)}', // ignore: lines_longer_than_80_chars
    );
  }

  static final dateFormat = DateFormat.Hm();
}

extension MainPageListItemEx on MainPageListItem {
  String get key => title + info1 + info2;
}
