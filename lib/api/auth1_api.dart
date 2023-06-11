import 'package:http/http.dart' as http;
import 'package:razio/entity/auth1.dart';

class Auth1Api {
  Future<Auth1> fetch() async {
    final url = Uri.parse('https://radiko.jp/v2/api/auth1');
    final request = http.Request('get', url);
    const header = {
      'content-type': 'application/json',
      'X-Radiko-App': 'pc_html5',
      'X-Radiko-App-Version': '0.0.1',
      'X-Radiko-User': 'dummy_user',
      'X-Radiko-Device': 'pc'
    };
    request.headers.clear();
    request.headers.addAll(header);
    final auth1Response = await request.send();
    if (auth1Response.statusCode != 200) {
      throw Exception('Failed to auth1Request');
    }

    final authToken = auth1Response.headers['x-radiko-authtoken'];
    final keyOffset = auth1Response.headers['x-radiko-keyoffset'];
    final keyLength = auth1Response.headers['x-radiko-keylength'];
    if (authToken == null || keyOffset == null || keyLength == null) {
      throw Exception('Required parameter is nil');
    }
    return Auth1(
      authToken: authToken,
      keyOffset: int.parse(keyOffset),
      keyLength: int.parse(keyLength),
    );
  }
}
