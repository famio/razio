import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info.freezed.dart';

@freezed
abstract class AuthInfo with _$AuthInfo {
  factory AuthInfo({
    required String authToken,
    required String areaId,
  }) = _AuthInfo;
}
