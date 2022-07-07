import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/selected_station_provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

final selectedStationTodaysProgramListProvider =
    FutureProvider<List<Program>?>((ref) async {
  final selectedStationId = ref.watch(selectedStationIdProvider);
  final now = DateTime.now();
  final outputFormat = DateFormat('yyyyMMdd');
  String today = outputFormat
      .format(now.hour < 5 ? now.subtract(const Duration(days: 1)) : now);
  if (selectedStationId == null) return null;
  final url = Uri.parse(
      'https://radiko.jp/v3/program/station/date/$today/$selectedStationId.xml');
  final request = http.Request('get', url);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to program list request');
  }
  final body = await response.stream.bytesToString();
  final root = XmlDocument.parse(body).findAllElements('progs').first;
  return root
      .findElements('prog')
      .map<Program>((e) => Program.fromElement(e))
      .toList();
});
