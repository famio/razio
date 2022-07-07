import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth2.freezed.dart';

@freezed
class Auth2 with _$Auth2 {
  factory Auth2({
    required String areaId,
  }) = _Auth2;
}
