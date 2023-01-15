import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class Search with _$Search {
  factory Search({
    required List<SearchProgram> data,
  }) = _Search;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}

@freezed
class SearchProgram with _$SearchProgram {
  factory SearchProgram({
    required int tsInNg,
    required List<SearchProgramMeta> metas,
    required int tsOutNg,
    required String stationId,
    required Uri programUrl,
    required String status,
    required String startTimeS,
    required SearchProgramGenre genre,
    required String title,
    required String endTimeS,
    required String performer,
    required DateTime startTime,
    required DateTime endTime,
    required String programDate,
    required String info,
    required Uri img,
    required String description,
  }) = _SearchProgram;

  factory SearchProgram.fromJson(Map<String, dynamic> json) =>
      _$SearchProgramFromJson(json);
}

@freezed
class SearchProgramMeta with _$SearchProgramMeta {
  factory SearchProgramMeta({
    required String name,
    required String value,
  }) = _SearchProgramMeta;

  factory SearchProgramMeta.fromJson(Map<String, dynamic> json) =>
      _$SearchProgramMetaFromJson(json);
}

@freezed
class SearchProgramGenre with _$SearchProgramGenre {
  factory SearchProgramGenre({
    SearchProgramGenreData? personality,
    SearchProgramGenreData? program,
  }) = _SearchProgramGenre;

  factory SearchProgramGenre.fromJson(Map<String, dynamic> json) =>
      _$SearchProgramGenreFromJson(json);
}

@freezed
class SearchProgramGenreData with _$SearchProgramGenreData {
  factory SearchProgramGenreData({
    required String id,
    required String name,
  }) = _SearchProgramGenreData;

  factory SearchProgramGenreData.fromJson(Map<String, dynamic> json) =>
      _$SearchProgramGenreDataFromJson(json);
}
