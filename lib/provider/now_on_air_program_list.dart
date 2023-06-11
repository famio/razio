import 'dart:async';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:razio/entity/program.dart';
import 'package:razio/provider/auth_provider.dart';
import 'package:razio/provider/selected_station_id_provider.dart';
import 'package:xml/xml.dart';

Timer? _timer;

final nowOnAirProgramListProvider = FutureProvider<List<Program>>((ref) async {
  final authInfo = await ref.watch(authProvider.future);
  final url =
      Uri.parse('https://radiko.jp/v3/program/now/${authInfo.areaId}.xml');
  final request = http.Request('get', url);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to program list request');
  }
  final body = await response.stream.bytesToString();
  final root = XmlDocument.parse(body).findAllElements('stations').first;

  final now = DateTime.now();
  final result = <Program>[];
  root.findElements('station').forEach((element) {
    final stationId = element.getAttribute('id');
    if (stationId == null) {
      return;
    }
    final stationName = element.findElements('name').first.innerText;

    final programs = element
        .findElements('progs')
        .first
        .findElements('prog')
        .map<Program>(
          (element) => Program.from(
            stationId: stationId,
            stationName: stationName,
            programElement: element,
          ),
        )
        .toList();

    final program = programs.firstWhereOrNull((element) {
      return element.startDate.isAtSameMomentAs(now) ||
          (element.startDate.isBefore(now) && element.endDate.isAfter(now));
    });
    if (program != null) {
      result.add(program);
    }
  });

  if (ref.read(selectedLiveStationIdProvider.notifier).state == null) {
    ref.read(selectedLiveStationIdProvider.notifier).state =
        result.first.stationId;
  }

  _setRefreshTimer(ref, result.toList());

  return result;
});

void _setRefreshTimer(Ref ref, List<Program> programs) {
  final now = DateTime.now();
  final program = programs.sortedBy((element) => element.endTime).first;
  if (program.endDate.isAfter(now)) {
    final diff = program.endDate.difference(now);
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer(diff, () => ref.refresh(nowOnAirProgramListProvider));
  } else {
    ref.invalidate(nowOnAirProgramListProvider);
  }
}
