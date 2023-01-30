import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/entity/search.dart';
import 'package:intl/intl.dart';

part 'main_page_list_item.freezed.dart';

@freezed
class MainPageListItem with _$MainPageListItem {
  factory MainPageListItem({
    required String stationName,
    required String imageUrl,
    required String title,
    required String programDate,
  }) = _MainPageListItem;

  factory MainPageListItem.fromElement({
    required String stationName,
    required Program program,
  }) {
    return MainPageListItem(
      stationName: stationName,
      imageUrl: program.img,
      title: program.title,
      programDate:
          '${dateFormat.format(program.startDate)} ~ ${dateFormat.format(program.endDate)}',
    );
  }

  factory MainPageListItem.fromSearchProgram({
    required SearchProgram program,
  }) {
    return MainPageListItem(
      stationName: program.stationId,
      imageUrl: program.img.toString(),
      title: program.title,
      programDate:
          '${searchResultFormat.format(program.startTime)} ~ ${dateFormat.format(program.endTime)}',
    );
  }

  static final dateFormat = DateFormat.Hm();

  static final searchResultFormat = DateFormat.Md().add_Hm();
}
