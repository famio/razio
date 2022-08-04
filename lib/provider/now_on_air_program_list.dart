import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

Timer? _timer;

final nowOnAirProgramListProvider =
    FutureProvider<Map<String, Program>>((ref) async {
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
  var result = <String, Program>{};
  root.findElements('station').forEach((element) {
    final stationId =
        element.attributes.firstWhere((p0) => p0.name == XmlName('id')).value;

    final programs = element
        .findElements('progs')
        .first
        .findElements('prog')
        .map<Program>((e) => Program.fromElement(e))
        .toList();

    final program = programs.firstWhereOrNull((element) {
      return element.startDate.isAtSameMomentAs(now) ||
          (element.startDate.isBefore(now) && element.endDate.isAfter(now));
    });
    if (program != null) {
      result[stationId] = program;
    }
  });

  _setRefreshTimer(ref, result.values.toList());

  return result;
});

void _setRefreshTimer(Ref ref, List<Program> programs) {
  final now = DateTime.now();
  final program = programs.sortedBy((element) => element.endTime).first;
  if (program.endDate.isAfter(now)) {
    final diff = program.endDate.difference(now);
    print('diff: ${diff.inSeconds}');
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer(diff, () => ref.refresh(nowOnAirProgramListProvider));
  } else {
    ref.refresh(nowOnAirProgramListProvider);
  }
}

final nowOnAirProgramProvider = FutureProvider.family<Program?, String>(
  (ref, stationId) {
    final programlist = ref.watch(nowOnAirProgramListProvider);
    return programlist.maybeWhen(
        data: (data) {
          print('title: ${data[stationId]?.title}');
          return data[stationId];
        },
        orElse: () => null);
  },
);
