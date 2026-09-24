// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_circle_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundCircleParameters {

 double get opacity; Offset get position;
/// Create a copy of BackgroundCircleParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundCircleParametersCopyWith<BackgroundCircleParameters> get copyWith => _$BackgroundCircleParametersCopyWithImpl<BackgroundCircleParameters>(this as BackgroundCircleParameters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundCircleParameters&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,opacity,position);

@override
String toString() {
  return 'BackgroundCircleParameters(opacity: $opacity, position: $position)';
}


}

/// @nodoc
abstract mixin class $BackgroundCircleParametersCopyWith<$Res>  {
  factory $BackgroundCircleParametersCopyWith(BackgroundCircleParameters value, $Res Function(BackgroundCircleParameters) _then) = _$BackgroundCircleParametersCopyWithImpl;
@useResult
$Res call({
 double opacity, Offset position
});




}
/// @nodoc
class _$BackgroundCircleParametersCopyWithImpl<$Res>
    implements $BackgroundCircleParametersCopyWith<$Res> {
  _$BackgroundCircleParametersCopyWithImpl(this._self, this._then);

  final BackgroundCircleParameters _self;
  final $Res Function(BackgroundCircleParameters) _then;

/// Create a copy of BackgroundCircleParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? opacity = null,Object? position = null,}) {
  return _then(_self.copyWith(
opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Offset,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundCircleParameters].
extension BackgroundCircleParametersPatterns on BackgroundCircleParameters {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundCircleParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundCircleParameters() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundCircleParameters value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundCircleParameters():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundCircleParameters value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundCircleParameters() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double opacity,  Offset position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundCircleParameters() when $default != null:
return $default(_that.opacity,_that.position);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double opacity,  Offset position)  $default,) {final _that = this;
switch (_that) {
case _BackgroundCircleParameters():
return $default(_that.opacity,_that.position);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double opacity,  Offset position)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundCircleParameters() when $default != null:
return $default(_that.opacity,_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundCircleParameters implements BackgroundCircleParameters {
  const _BackgroundCircleParameters({required this.opacity, required this.position});
  

@override final  double opacity;
@override final  Offset position;

/// Create a copy of BackgroundCircleParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundCircleParametersCopyWith<_BackgroundCircleParameters> get copyWith => __$BackgroundCircleParametersCopyWithImpl<_BackgroundCircleParameters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundCircleParameters&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,opacity,position);

@override
String toString() {
  return 'BackgroundCircleParameters(opacity: $opacity, position: $position)';
}


}

/// @nodoc
abstract mixin class _$BackgroundCircleParametersCopyWith<$Res> implements $BackgroundCircleParametersCopyWith<$Res> {
  factory _$BackgroundCircleParametersCopyWith(_BackgroundCircleParameters value, $Res Function(_BackgroundCircleParameters) _then) = __$BackgroundCircleParametersCopyWithImpl;
@override @useResult
$Res call({
 double opacity, Offset position
});




}
/// @nodoc
class __$BackgroundCircleParametersCopyWithImpl<$Res>
    implements _$BackgroundCircleParametersCopyWith<$Res> {
  __$BackgroundCircleParametersCopyWithImpl(this._self, this._then);

  final _BackgroundCircleParameters _self;
  final $Res Function(_BackgroundCircleParameters) _then;

/// Create a copy of BackgroundCircleParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? opacity = null,Object? position = null,}) {
  return _then(_BackgroundCircleParameters(
opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Offset,
  ));
}


}

// dart format on
