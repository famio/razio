// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Auth1 {
  String get authToken => throw _privateConstructorUsedError;
  int get keyOffset => throw _privateConstructorUsedError;
  int get keyLength => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Auth1CopyWith<Auth1> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth1CopyWith<$Res> {
  factory $Auth1CopyWith(Auth1 value, $Res Function(Auth1) then) =
      _$Auth1CopyWithImpl<$Res, Auth1>;
  @useResult
  $Res call({String authToken, int keyOffset, int keyLength});
}

/// @nodoc
class _$Auth1CopyWithImpl<$Res, $Val extends Auth1>
    implements $Auth1CopyWith<$Res> {
  _$Auth1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? keyOffset = null,
    Object? keyLength = null,
  }) {
    return _then(_value.copyWith(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      keyOffset: null == keyOffset
          ? _value.keyOffset
          : keyOffset // ignore: cast_nullable_to_non_nullable
              as int,
      keyLength: null == keyLength
          ? _value.keyLength
          : keyLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Auth1CopyWith<$Res> implements $Auth1CopyWith<$Res> {
  factory _$$_Auth1CopyWith(_$_Auth1 value, $Res Function(_$_Auth1) then) =
      __$$_Auth1CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authToken, int keyOffset, int keyLength});
}

/// @nodoc
class __$$_Auth1CopyWithImpl<$Res> extends _$Auth1CopyWithImpl<$Res, _$_Auth1>
    implements _$$_Auth1CopyWith<$Res> {
  __$$_Auth1CopyWithImpl(_$_Auth1 _value, $Res Function(_$_Auth1) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? keyOffset = null,
    Object? keyLength = null,
  }) {
    return _then(_$_Auth1(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      keyOffset: null == keyOffset
          ? _value.keyOffset
          : keyOffset // ignore: cast_nullable_to_non_nullable
              as int,
      keyLength: null == keyLength
          ? _value.keyLength
          : keyLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Auth1 implements _Auth1 {
  _$_Auth1(
      {required this.authToken,
      required this.keyOffset,
      required this.keyLength});

  @override
  final String authToken;
  @override
  final int keyOffset;
  @override
  final int keyLength;

  @override
  String toString() {
    return 'Auth1(authToken: $authToken, keyOffset: $keyOffset, keyLength: $keyLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth1 &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.keyOffset, keyOffset) ||
                other.keyOffset == keyOffset) &&
            (identical(other.keyLength, keyLength) ||
                other.keyLength == keyLength));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authToken, keyOffset, keyLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Auth1CopyWith<_$_Auth1> get copyWith =>
      __$$_Auth1CopyWithImpl<_$_Auth1>(this, _$identity);
}

abstract class _Auth1 implements Auth1 {
  factory _Auth1(
      {required final String authToken,
      required final int keyOffset,
      required final int keyLength}) = _$_Auth1;

  @override
  String get authToken;
  @override
  int get keyOffset;
  @override
  int get keyLength;
  @override
  @JsonKey(ignore: true)
  _$$_Auth1CopyWith<_$_Auth1> get copyWith =>
      throw _privateConstructorUsedError;
}
