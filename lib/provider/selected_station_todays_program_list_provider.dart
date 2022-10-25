import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

final selectedStationTodaysProgramListProvider =
    FutureProvider<List<Program>?>((ref) async {
  final selectedStationId = ref.watch(selectedStationIdProvider);
  if (selectedStationId == null) {
    return null;
  }

  final now = DateTime.now();
  final outputFormat = DateFormat('yyyyMMdd');
  final today = outputFormat
      .format(now.hour < 5 ? now.subtract(const Duration(days: 1)) : now);
  final tomorrow = outputFormat.format(
    now.hour < 5
        ? now.subtract(const Duration(days: 2))
        : now.subtract(const Duration(days: 1)),
  );
  final todaysProgramList = await _fetchProgramList(today, selectedStationId);
  final tomorrowsProgramList =
      await _fetchProgramList(tomorrow, selectedStationId);
  return todaysProgramList + tomorrowsProgramList;
});

Future<List<Program>> _fetchProgramList(String day, String stationId) async {
  final url = Uri.parse(
    'https://radiko.jp/v3/program/station/date/$day/$stationId.xml',
  );
  final request = http.Request('get', url);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to program list request');
  }
  final body = await response.stream.bytesToString();
  final root = XmlDocument.parse(body).findAllElements('progs').first;
  return root.findElements('prog').map<Program>(Program.fromElement).toList();
}
