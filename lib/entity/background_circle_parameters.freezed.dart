// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_circle_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BackgroundCircleParameters {
  double get opacity => throw _privateConstructorUsedError;
  Offset get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackgroundCircleParametersCopyWith<BackgroundCircleParameters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundCircleParametersCopyWith<$Res> {
  factory $BackgroundCircleParametersCopyWith(BackgroundCircleParameters value,
          $Res Function(BackgroundCircleParameters) then) =
      _$BackgroundCircleParametersCopyWithImpl<$Res,
          BackgroundCircleParameters>;
  @useResult
  $Res call({double opacity, Offset position});
}

/// @nodoc
class _$BackgroundCircleParametersCopyWithImpl<$Res,
        $Val extends BackgroundCircleParameters>
    implements $BackgroundCircleParametersCopyWith<$Res> {
  _$BackgroundCircleParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opacity = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      opacity: null == opacity
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BackgroundCircleParametersCopyWith<$Res>
    implements $BackgroundCircleParametersCopyWith<$Res> {
  factory _$$_BackgroundCircleParametersCopyWith(
          _$_BackgroundCircleParameters value,
          $Res Function(_$_BackgroundCircleParameters) then) =
      __$$_BackgroundCircleParametersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double opacity, Offset position});
}

/// @nodoc
class __$$_BackgroundCircleParametersCopyWithImpl<$Res>
    extends _$BackgroundCircleParametersCopyWithImpl<$Res,
        _$_BackgroundCircleParameters>
    implements _$$_BackgroundCircleParametersCopyWith<$Res> {
  __$$_BackgroundCircleParametersCopyWithImpl(
      _$_BackgroundCircleParameters _value,
      $Res Function(_$_BackgroundCircleParameters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opacity = null,
    Object? position = null,
  }) {
    return _then(_$_BackgroundCircleParameters(
      opacity: null == opacity
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_BackgroundCircleParameters implements _BackgroundCircleParameters {
  const _$_BackgroundCircleParameters(
      {required this.opacity, required this.position});

  @override
  final double opacity;
  @override
  final Offset position;

  @override
  String toString() {
    return 'BackgroundCircleParameters(opacity: $opacity, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackgroundCircleParameters &&
            (identical(other.opacity, opacity) || other.opacity == opacity) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, opacity, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BackgroundCircleParametersCopyWith<_$_BackgroundCircleParameters>
      get copyWith => __$$_BackgroundCircleParametersCopyWithImpl<
          _$_BackgroundCircleParameters>(this, _$identity);
}

abstract class _BackgroundCircleParameters
    implements BackgroundCircleParameters {
  const factory _BackgroundCircleParameters(
      {required final double opacity,
      required final Offset position}) = _$_BackgroundCircleParameters;

  @override
  double get opacity;
  @override
  Offset get position;
  @override
  @JsonKey(ignore: true)
  _$$_BackgroundCircleParametersCopyWith<_$_BackgroundCircleParameters>
      get copyWith => throw _privateConstructorUsedError;
}
