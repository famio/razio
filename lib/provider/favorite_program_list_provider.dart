import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:razio/api/search_api.dart';
import 'package:razio/entity/favorite_program.dart';
import 'package:razio/entity/search.dart';
import 'package:razio/provider/auth_provider.dart';
import 'package:razio/provider/favorite_list_provider.dart';

/// お気に入り番組のタイムフリーで視聴可能な回(新しい順)
final favoriteAvailableProgramListProvider =
    FutureProvider<List<SearchProgram>>((ref) async {
  final programs = await _fetchFavoritePrograms(ref, SearchFilter.past);
  return programs.sorted((a, b) => b.startTime.compareTo(a.startTime));
});

/// お気に入り番組の放送中とこれから放送される回(放送開始が近い順)
/// 放送中の回は、それに続く帯番組の枠を通知しないために含める
final favoriteUpcomingProgramListProvider =
    FutureProvider<List<SearchProgram>>((ref) async {
  final programs = await _fetchFavoritePrograms(ref, SearchFilter.future);
  return programs.sorted((a, b) => a.startTime.compareTo(b.startTime));
});

Future<List<SearchProgram>> _fetchFavoritePrograms(
  Ref ref,
  SearchFilter filter,
) async {
  final favorites = ref.watch(favoriteListProvider);
  if (favorites.isEmpty) {
    return [];
  }
  final authInfo = await ref.read(authProvider.future);
  final results = await Future.wait(
    favorites.map((favorite) => _fetch(favorite, authInfo.areaId, filter)),
  );
  // 複数のお気に入りの検索結果に同じ回が含まれることがあるため重複を除く
  final seen = <String>{};
  return results.flattened
      .where((e) => seen.add('${e.stationId}${e.startTime}'))
      .toList();
}

Future<List<SearchProgram>> _fetch(
  FavoriteProgram favorite,
  String areaId,
  SearchFilter filter,
) async {
  final search = await SearchApi().fetch(
    keyword: favorite.title,
    areaId: areaId,
    filter: filter,
    // 帯番組は1回の放送が複数の枠に分かれているため、多めに取得する
    rowLimit: 50,
  );
  return search.data
      .where((e) => favorite.matches(stationId: e.stationId, title: e.title))
      .toList();
}
