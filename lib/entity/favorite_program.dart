import 'package:collection/collection.dart';

/// お気に入りに登録した番組シリーズ
/// 放送局IDと、枠や回の表記を除いた番組タイトル([seriesTitleOf])の組み合わせで識別する
/// radikoのAPIには番組シリーズを一意に示すIDが無いため
class FavoriteProgram {
  const FavoriteProgram({
    required this.stationId,
    required this.title,
    required this.img,
  });

  factory FavoriteProgram.fromJson(Map<String, dynamic> json) {
    return FavoriteProgram(
      stationId: json['stationId'] as String,
      title: seriesTitleOf(json['title'] as String),
      img: json['img'] as String,
    );
  }

  final String stationId;

  /// 番組シリーズのタイトル
  final String title;
  final String img;

  String get key => '$stationId|$title';

  /// 放送回がこの番組シリーズのものかどうか
  bool matches({required String stationId, required String title}) {
    return this.stationId == stationId && this.title == seriesTitleOf(title);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'stationId': stationId,
        'title': title,
        'img': img,
      };
}

/// 番組タイトルの末尾に付く、帯番組の枠や回の表記
/// 例: 「荻上チキ・Session (1)」「大竹まこと ゴールデンラジオ！ 11時30分～13時」
final _seriesSuffixPatterns = [
  // (1) （９８）
  RegExp(r'[\s　]*[(（][0-9０-９]+[)）]$'),
  // (PART3)
  RegExp(r'[\s　]*[(（](PART|Part|part|パート)[\s　]*[0-9０-９]+[)）]$'),
  // （13時台）
  RegExp(r'[\s　]*[(（][0-9０-９]+時台[)）]$'),
  // 10時～11時 11時30分～13時
  RegExp(
    r'[\s　]*[0-9０-９]+時([0-9０-９]+分)?[～〜~\-－][0-9０-９]+時([0-9０-９]+分)?$',
  ),
];

/// 番組タイトルから、帯番組の枠や回の表記を取り除いた番組シリーズのタイトルを返す
String seriesTitleOf(String title) {
  var result = title.trim();
  while (true) {
    final pattern =
        _seriesSuffixPatterns.firstWhereOrNull((e) => e.hasMatch(result));
    if (pattern == null) {
      return result;
    }
    final stripped = result.replaceFirst(pattern, '');
    // 枠の表記だけのタイトルは、そのまま番組シリーズのタイトルとする
    if (stripped.isEmpty) {
      return result;
    }
    result = stripped;
  }
}
