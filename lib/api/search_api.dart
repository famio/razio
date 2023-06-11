import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:razio/entity/search.dart';
import 'package:razio/util.dart';

enum SearchFilter {
  past('past'),
  future('future'),
  ;

  const SearchFilter(this.value);
  final String value;
}

class SearchApi {
  Future<Search> fetch({
    required String keyword,
    required String areaId,
    SearchFilter? filter,
  }) async {
    final queryParams = <String, dynamic>{
      'key': keyword,
      'filter': filter == null ? '' : filter.value,
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
}
