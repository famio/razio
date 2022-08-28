import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/selected_station_provider.dart';

final selectedStationOnAirProgramProvider =
    FutureProvider<Program?>((ref) async {
  final selectedStationId = ref.watch(selectedStationIdProvider);
  if (selectedStationId == null) {
    return null;
  }
  final programs = await ref.watch(nowOnAirProgramListProvider.future);
  return programs[selectedStationId];
});
