import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

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
  return result;
});
