// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthInfo {
  String get authToken => throw _privateConstructorUsedError;
  String get areaId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthInfoCopyWith<AuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInfoCopyWith<$Res> {
  factory $AuthInfoCopyWith(AuthInfo value, $Res Function(AuthInfo) then) =
      _$AuthInfoCopyWithImpl<$Res>;
  $Res call({String authToken, String areaId});
}

/// @nodoc
class _$AuthInfoCopyWithImpl<$Res> implements $AuthInfoCopyWith<$Res> {
  _$AuthInfoCopyWithImpl(this._value, this._then);

  final AuthInfo _value;
  // ignore: unused_field
  final $Res Function(AuthInfo) _then;

  @override
  $Res call({
    Object? authToken = freezed,
    Object? areaId = freezed,
  }) {
    return _then(_value.copyWith(
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      areaId: areaId == freezed
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthInfoCopyWith<$Res> implements $AuthInfoCopyWith<$Res> {
  factory _$$_AuthInfoCopyWith(
          _$_AuthInfo value, $Res Function(_$_AuthInfo) then) =
      __$$_AuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String authToken, String areaId});
}

/// @nodoc
class __$$_AuthInfoCopyWithImpl<$Res> extends _$AuthInfoCopyWithImpl<$Res>
    implements _$$_AuthInfoCopyWith<$Res> {
  __$$_AuthInfoCopyWithImpl(
      _$_AuthInfo _value, $Res Function(_$_AuthInfo) _then)
      : super(_value, (v) => _then(v as _$_AuthInfo));

  @override
  _$_AuthInfo get _value => super._value as _$_AuthInfo;

  @override
  $Res call({
    Object? authToken = freezed,
    Object? areaId = freezed,
  }) {
    return _then(_$_AuthInfo(
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      areaId: areaId == freezed
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthInfo implements _AuthInfo {
  _$_AuthInfo({required this.authToken, required this.areaId});

  @override
  final String authToken;
  @override
  final String areaId;

  @override
  String toString() {
    return 'AuthInfo(authToken: $authToken, areaId: $areaId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthInfo &&
            const DeepCollectionEquality().equals(other.authToken, authToken) &&
            const DeepCollectionEquality().equals(other.areaId, areaId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authToken),
      const DeepCollectionEquality().hash(areaId));

  @JsonKey(ignore: true)
  @override
  _$$_AuthInfoCopyWith<_$_AuthInfo> get copyWith =>
      __$$_AuthInfoCopyWithImpl<_$_AuthInfo>(this, _$identity);
}

abstract class _AuthInfo implements AuthInfo {
  factory _AuthInfo(
      {required final String authToken,
      required final String areaId}) = _$_AuthInfo;

  @override
  String get authToken => throw _privateConstructorUsedError;
  @override
  String get areaId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthInfoCopyWith<_$_AuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
