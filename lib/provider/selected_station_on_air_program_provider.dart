import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/selected_station_provider.dart';

final selectedStationOnAirProgramProvider =
    FutureProvider<Program?>((ref) async {
  // リアルタイム取得ver
  // final programs =
  //     await ref.watch(selectedStationTodaysProgramListProvider.future);
  // if (programs == null) return null;

  // final now = DateTime.now();
  // final program = programs.firstWhereOrNull((element) {
  //   final startTimeWithT =
  //       '${element.startTime.substring(0, 8)}T${element.startTime.substring(8)}';
  //   final endTimeWithT =
  //       '${element.endTime.substring(0, 8)}T${element.endTime.substring(8)}';
  //   final startDate = DateTime.parse(startTimeWithT);
  //   final endDate = DateTime.parse(endTimeWithT);
  //   return startDate.isAtSameMomentAs(now) ||
  //       (startDate.isBefore(now) && endDate.isAfter(now));
  // });
  // return program;

  final selectedStationId = ref.watch(selectedStationIdProvider);
  if (selectedStationId == null) return null;
  final programs = await ref.watch(nowOnAirProgramListProvider.future);
  return programs[selectedStationId];
});
