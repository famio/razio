import 'package:fudiko/entity/main_page_list_item.dart';
import 'package:fudiko/provider/main_page_list_mode_provider.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/search_result_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _mainPageListItemWrapperProvider =
    FutureProvider<List<MainPageListItem>>((ref) {
  switch (ref.watch(mainPageListModeProvider)) {
    case MainPageListMode.live:
      return ref.watch(nowOnAirProgramListProvider.future).then(
            (value) => value
                .map(
                  (e) => MainPageListItem.fromProgram(program: e),
                )
                .toList(),
          );
    case MainPageListMode.search:
      return ref.watch(searchResultListProvider.future).then(
            (value) => value
                .map((e) => MainPageListItem.fromSearchProgram(program: e))
                .toList(),
          );
  }
});

final mainPageListItemProvider = Provider<List<MainPageListItem>>((ref) {
  ref.listen(_mainPageListItemWrapperProvider, (previous, next) {
    next.whenData((value) {
      if (previous?.value != value) {
        ref.state = value;
      }
    });
  });
  return [];
});
