import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/entity/search.dart';
import 'package:intl/intl.dart';

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
          '${dateFormat.format(program.startDate)} ~ ${dateFormat.format(program.endDate)}',
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
          '${dateFormat.format(program.startTime)} ~ ${dateFormat.format(program.endTime)}',
    );
  }

  static final dateFormat = DateFormat.Hm();
}
