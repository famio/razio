import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedStationOnAirProgramProvider = Provider<Program?>((ref) {
  final selectedStationId = ref.watch(selectedStationIdProvider);
  if (selectedStationId == null) {
    return null;
  }
  final programs = ref.watch(nowOnAirProgramListProvider);
  final program = programs.whenOrNull(
    data: (data) => data[selectedStationId],
  );
  return program;
});
