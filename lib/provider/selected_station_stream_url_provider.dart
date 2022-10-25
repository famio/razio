import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:http/http.dart' as http;

final selectedStationStreamUrlProvider = FutureProvider<String?>((ref) async {
  final selectedStationId = ref.watch(selectedStationIdProvider);
  if (selectedStationId == null) {
    return null;
  }
  final authinfo = ref.watch(authProvider);
  final authinfoData = authinfo.asData;
  if (authinfoData == null) {
    return null;
  }
  final url = Uri.parse(
    'http://f-radiko.smartstream.ne.jp/$selectedStationId/_definst_/simul-stream.stream/playlist.m3u8',
  );
  final request = http.Request('get', url);
  final header = {
    'X-Radiko-AuthToken': authinfoData.value.authToken,
  };
  request.headers.clear();
  request.headers.addAll(header);
  final response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Failed to auth1Request');
  }
  final body = await response.stream.bytesToString();
  final reg = RegExp(r'^https?://.+m3u8$', multiLine: true);
  return reg.firstMatch(body)?.group(0);
});
