import 'package:fudiko/api/auth1_api.dart';
import 'package:fudiko/api/auth2_api.dart';
import 'package:fudiko/entity/auth_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = FutureProvider<AuthInfo>((ref) async {
  final auth1 = await Auth1Api().fetch();
  final auth2 = await Auth2Api().fetch(
    auth1.authToken,
    auth1.keyOffset,
    auth1.keyLength,
  );
  return AuthInfo(
    authToken: auth1.authToken,
    areaId: auth2.areaId,
  );
});
