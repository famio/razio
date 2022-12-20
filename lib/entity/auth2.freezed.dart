// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Auth2 {
  String get areaId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Auth2CopyWith<Auth2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth2CopyWith<$Res> {
  factory $Auth2CopyWith(Auth2 value, $Res Function(Auth2) then) =
      _$Auth2CopyWithImpl<$Res, Auth2>;
  @useResult
  $Res call({String areaId});
}

/// @nodoc
class _$Auth2CopyWithImpl<$Res, $Val extends Auth2>
    implements $Auth2CopyWith<$Res> {
  _$Auth2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? areaId = null,
  }) {
    return _then(_value.copyWith(
      areaId: null == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Auth2CopyWith<$Res> implements $Auth2CopyWith<$Res> {
  factory _$$_Auth2CopyWith(_$_Auth2 value, $Res Function(_$_Auth2) then) =
      __$$_Auth2CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String areaId});
}

/// @nodoc
class __$$_Auth2CopyWithImpl<$Res> extends _$Auth2CopyWithImpl<$Res, _$_Auth2>
    implements _$$_Auth2CopyWith<$Res> {
  __$$_Auth2CopyWithImpl(_$_Auth2 _value, $Res Function(_$_Auth2) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? areaId = null,
  }) {
    return _then(_$_Auth2(
      areaId: null == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Auth2 implements _Auth2 {
  _$_Auth2({required this.areaId});

  @override
  final String areaId;

  @override
  String toString() {
    return 'Auth2(areaId: $areaId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth2 &&
            (identical(other.areaId, areaId) || other.areaId == areaId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, areaId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Auth2CopyWith<_$_Auth2> get copyWith =>
      __$$_Auth2CopyWithImpl<_$_Auth2>(this, _$identity);
}

abstract class _Auth2 implements Auth2 {
  factory _Auth2({required final String areaId}) = _$_Auth2;

  @override
  String get areaId;
  @override
  @JsonKey(ignore: true)
  _$$_Auth2CopyWith<_$_Auth2> get copyWith =>
      throw _privateConstructorUsedError;
}
