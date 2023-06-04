import 'package:fudiko/entity/main_page_list_item.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/search_result_list_provider.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainPageLiveListItemProvider = Provider<List<MainPageListItem>>((ref) {
  final programs = ref.watch(nowOnAirProgramListProvider).valueOrNull ?? [];
  return programs
      .map(
        (e) => MainPageListItem.fromProgram(program: e),
      )
      .toList();
});

final mainPageSearchListItemProvider = Provider<List<MainPageListItem>>((ref) {
  final programs = ref.watch(searchResultListProvider).valueOrNull ?? [];
  final result = programs
      .map(
        (e) => MainPageListItem.fromSearchProgram(program: e),
      )
      .toList();
  final stationId = ref.watch(selectedLiveStationIdProvider);
  final programList = ref.watch(nowOnAirProgramListProvider).valueOrNull;
  if (stationId != null && programList != null) {
    result.insert(
      0,
      MainPageListItem.fromProgram(
        program: programList.firstWhere(
          (element) => element.stationId == stationId,
        ),
      ),
    );
  }
  return result;
});
