// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Auth2 {

 String get areaId;
/// Create a copy of Auth2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Auth2CopyWith<Auth2> get copyWith => _$Auth2CopyWithImpl<Auth2>(this as Auth2, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Auth2&&(identical(other.areaId, areaId) || other.areaId == areaId));
}


@override
int get hashCode => Object.hash(runtimeType,areaId);

@override
String toString() {
  return 'Auth2(areaId: $areaId)';
}


}

/// @nodoc
abstract mixin class $Auth2CopyWith<$Res>  {
  factory $Auth2CopyWith(Auth2 value, $Res Function(Auth2) _then) = _$Auth2CopyWithImpl;
@useResult
$Res call({
 String areaId
});




}
/// @nodoc
class _$Auth2CopyWithImpl<$Res>
    implements $Auth2CopyWith<$Res> {
  _$Auth2CopyWithImpl(this._self, this._then);

  final Auth2 _self;
  final $Res Function(Auth2) _then;

/// Create a copy of Auth2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? areaId = null,}) {
  return _then(_self.copyWith(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Auth2].
extension Auth2Patterns on Auth2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Auth2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Auth2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Auth2 value)  $default,){
final _that = this;
switch (_that) {
case _Auth2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Auth2 value)?  $default,){
final _that = this;
switch (_that) {
case _Auth2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String areaId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Auth2() when $default != null:
return $default(_that.areaId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String areaId)  $default,) {final _that = this;
switch (_that) {
case _Auth2():
return $default(_that.areaId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String areaId)?  $default,) {final _that = this;
switch (_that) {
case _Auth2() when $default != null:
return $default(_that.areaId);case _:
  return null;

}
}

}

/// @nodoc


class _Auth2 implements Auth2 {
   _Auth2({required this.areaId});
  

@override final  String areaId;

/// Create a copy of Auth2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Auth2CopyWith<_Auth2> get copyWith => __$Auth2CopyWithImpl<_Auth2>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Auth2&&(identical(other.areaId, areaId) || other.areaId == areaId));
}


@override
int get hashCode => Object.hash(runtimeType,areaId);

@override
String toString() {
  return 'Auth2(areaId: $areaId)';
}


}

/// @nodoc
abstract mixin class _$Auth2CopyWith<$Res> implements $Auth2CopyWith<$Res> {
  factory _$Auth2CopyWith(_Auth2 value, $Res Function(_Auth2) _then) = __$Auth2CopyWithImpl;
@override @useResult
$Res call({
 String areaId
});




}
/// @nodoc
class __$Auth2CopyWithImpl<$Res>
    implements _$Auth2CopyWith<$Res> {
  __$Auth2CopyWithImpl(this._self, this._then);

  final _Auth2 _self;
  final $Res Function(_Auth2) _then;

/// Create a copy of Auth2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? areaId = null,}) {
  return _then(_Auth2(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
