import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/selected_station_provider.dart';

Timer? _timer;

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
  final program = programs[selectedStationId];
  if (program == null) return null;

  final now = DateTime.now();
  if (program.endDate.isAfter(now)) {
    final diff = program.endDate.difference(now);
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer(diff, () => ref.refresh(nowOnAirProgramListProvider));
  } else {
    ref.refresh(nowOnAirProgramListProvider);
  }
  return program;
});
