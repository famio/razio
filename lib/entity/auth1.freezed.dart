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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$Auth1ImplCopyWith<$Res> implements $Auth1CopyWith<$Res> {
  factory _$$Auth1ImplCopyWith(
          _$Auth1Impl value, $Res Function(_$Auth1Impl) then) =
      __$$Auth1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authToken, int keyOffset, int keyLength});
}

/// @nodoc
class __$$Auth1ImplCopyWithImpl<$Res>
    extends _$Auth1CopyWithImpl<$Res, _$Auth1Impl>
    implements _$$Auth1ImplCopyWith<$Res> {
  __$$Auth1ImplCopyWithImpl(
      _$Auth1Impl _value, $Res Function(_$Auth1Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? keyOffset = null,
    Object? keyLength = null,
  }) {
    return _then(_$Auth1Impl(
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

class _$Auth1Impl implements _Auth1 {
  _$Auth1Impl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth1Impl &&
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
  _$$Auth1ImplCopyWith<_$Auth1Impl> get copyWith =>
      __$$Auth1ImplCopyWithImpl<_$Auth1Impl>(this, _$identity);
}

abstract class _Auth1 implements Auth1 {
  factory _Auth1(
      {required final String authToken,
      required final int keyOffset,
      required final int keyLength}) = _$Auth1Impl;

  @override
  String get authToken;
  @override
  int get keyOffset;
  @override
  int get keyLength;
  @override
  @JsonKey(ignore: true)
  _$$Auth1ImplCopyWith<_$Auth1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
