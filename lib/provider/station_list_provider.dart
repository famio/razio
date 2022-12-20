import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/station.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

final stationListProvider = FutureProvider<List<Station>>((ref) async {
  final authInfo = await ref.watch(authProvider.future);
  final url =
      Uri.parse('https://radiko.jp/v3/station/list/${authInfo.areaId}.xml');
  final request = http.Request('get', url);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to station list request');
  }
  final body = await response.stream.bytesToString();
  final root = XmlDocument.parse(body).getElement('stations');
  if (root == null) {
    throw Exception('Stations did not exist in xml');
  }

  return root
      .findElements('station')
      .map<Station>(Station.fromElement)
      .toList();
});
