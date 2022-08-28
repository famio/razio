import 'dart:convert';

import 'package:fudiko/entity/auth2.dart';
import 'package:http/http.dart' as http;

class Auth2Api {
  Future<Auth2> fetch(
    String authToken,
    int keyOffset,
    int keyLength,
  ) async {
    const partialKeyBase = 'bcd151073c03b352e1ef2fd66c32209da9ca0afa';
    final rawPartialKey =
        partialKeyBase.substring(keyOffset, keyOffset + keyLength);
    final bytes = utf8.encode(rawPartialKey);
    final partialKey = base64.encode(bytes);

    final auth2Url = Uri.parse('https://radiko.jp/v2/api/auth2');
    final auth2Request = http.Request('get', auth2Url);
    final auth2Header = {
      'content-type': 'application/json',
      'X-Radiko-AuthToken': authToken,
      'X-Radiko-PartialKey': partialKey,
      'X-Radiko-User': 'dummy_user',
      'X-Radiko-Device': 'pc'
    };

    auth2Request.headers.clear();
    auth2Request.headers.addAll(auth2Header);
    final auth2Response = await auth2Request.send();
    if (auth2Response.statusCode != 200) {
      throw Exception('Failed to auth2Request');
    }
    final auth2ResponseBody = await auth2Response.stream.bytesToString();
    final splitedBody = auth2ResponseBody.split(',');
    final areaId = splitedBody.first;
    return Auth2(
      areaId: areaId,
    );
  }
}
