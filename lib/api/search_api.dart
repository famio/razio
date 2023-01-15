import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:fudiko/entity/search.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  Future<Search> fetch(String keyword, String areaId) async {
    final queryParams = <String, dynamic>{
      'key': keyword,
      'filter': '',
      'start_day': '',
      'end_day': '',
      'area_id': areaId,
      'region_id': '',
      'cul_area_id': areaId,
      'page_idx': '',
      'uid': generateUid(),
      'row_limit': '12',
      'app_id': 'pc',
      'cur_area_id': areaId,
      'action_id': '0',
    };
    final url = Uri.parse('https://radiko.jp/v3/api/program/search').replace(
      queryParameters: queryParams,
    );
    final request = http.Request('get', url);
    const header = {
      'content-type': 'application/json',
    };
    request.headers.clear();
    request.headers.addAll(header);

    final response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to auth1Request');
    }
    final body = await response.stream.bytesToString();
    final json = jsonDecode(body) as Map<String, dynamic>;
    return Search.fromJson(json);
  }

  String generateUid() {
    final random = math.Random().nextDouble() * 1000000000;
    final diff = DateTime.now().difference(DateTime.utc(1970)).inSeconds * 1000;
    return md5
        .convert(utf8.encode((random.toInt() + diff).toString()))
        .toString();
  }
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
