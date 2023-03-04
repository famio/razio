import 'package:collection/collection.dart';
import 'package:fudiko/api/search_api.dart';
import 'package:fudiko/entity/search.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/search_keyword_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchResultListProvider =
    FutureProvider<List<SearchProgram>>((ref) async {
  final authInfo = await ref.read(authProvider.future);
  final keyword = ref.read(searchKeywordProvider);
  final searchResult = await SearchApi().fetch(
    keyword: keyword,
    areaId: authInfo.areaId,
    filter: SearchFilter.past,
  );
  return searchResult.data.sorted((a, b) {
    final title = a.title.compareTo(b.title);
    if (title != 0) {
      return title;
    }
    return a.startTime.compareTo(b.startTime);
  });
});
