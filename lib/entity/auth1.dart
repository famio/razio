import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth1.freezed.dart';

@freezed
class Auth1 with _$Auth1 {
  factory Auth1({
    required String authToken,
    required int keyOffset,
    required int keyLength,
  }) = _Auth1;
}
