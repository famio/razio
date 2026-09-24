// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Auth1 {

 String get authToken; int get keyOffset; int get keyLength;
/// Create a copy of Auth1
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Auth1CopyWith<Auth1> get copyWith => _$Auth1CopyWithImpl<Auth1>(this as Auth1, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Auth1&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.keyOffset, keyOffset) || other.keyOffset == keyOffset)&&(identical(other.keyLength, keyLength) || other.keyLength == keyLength));
}


@override
int get hashCode => Object.hash(runtimeType,authToken,keyOffset,keyLength);

@override
String toString() {
  return 'Auth1(authToken: $authToken, keyOffset: $keyOffset, keyLength: $keyLength)';
}


}

/// @nodoc
abstract mixin class $Auth1CopyWith<$Res>  {
  factory $Auth1CopyWith(Auth1 value, $Res Function(Auth1) _then) = _$Auth1CopyWithImpl;
@useResult
$Res call({
 String authToken, int keyOffset, int keyLength
});




}
/// @nodoc
class _$Auth1CopyWithImpl<$Res>
    implements $Auth1CopyWith<$Res> {
  _$Auth1CopyWithImpl(this._self, this._then);

  final Auth1 _self;
  final $Res Function(Auth1) _then;

/// Create a copy of Auth1
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authToken = null,Object? keyOffset = null,Object? keyLength = null,}) {
  return _then(_self.copyWith(
authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,keyOffset: null == keyOffset ? _self.keyOffset : keyOffset // ignore: cast_nullable_to_non_nullable
as int,keyLength: null == keyLength ? _self.keyLength : keyLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Auth1].
extension Auth1Patterns on Auth1 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Auth1 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Auth1() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Auth1 value)  $default,){
final _that = this;
switch (_that) {
case _Auth1():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Auth1 value)?  $default,){
final _that = this;
switch (_that) {
case _Auth1() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authToken,  int keyOffset,  int keyLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Auth1() when $default != null:
return $default(_that.authToken,_that.keyOffset,_that.keyLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authToken,  int keyOffset,  int keyLength)  $default,) {final _that = this;
switch (_that) {
case _Auth1():
return $default(_that.authToken,_that.keyOffset,_that.keyLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authToken,  int keyOffset,  int keyLength)?  $default,) {final _that = this;
switch (_that) {
case _Auth1() when $default != null:
return $default(_that.authToken,_that.keyOffset,_that.keyLength);case _:
  return null;

}
}

}

/// @nodoc


class _Auth1 implements Auth1 {
   _Auth1({required this.authToken, required this.keyOffset, required this.keyLength});
  

@override final  String authToken;
@override final  int keyOffset;
@override final  int keyLength;

/// Create a copy of Auth1
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Auth1CopyWith<_Auth1> get copyWith => __$Auth1CopyWithImpl<_Auth1>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Auth1&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.keyOffset, keyOffset) || other.keyOffset == keyOffset)&&(identical(other.keyLength, keyLength) || other.keyLength == keyLength));
}


@override
int get hashCode => Object.hash(runtimeType,authToken,keyOffset,keyLength);

@override
String toString() {
  return 'Auth1(authToken: $authToken, keyOffset: $keyOffset, keyLength: $keyLength)';
}


}

/// @nodoc
abstract mixin class _$Auth1CopyWith<$Res> implements $Auth1CopyWith<$Res> {
  factory _$Auth1CopyWith(_Auth1 value, $Res Function(_Auth1) _then) = __$Auth1CopyWithImpl;
@override @useResult
$Res call({
 String authToken, int keyOffset, int keyLength
});




}
/// @nodoc
class __$Auth1CopyWithImpl<$Res>
    implements _$Auth1CopyWith<$Res> {
  __$Auth1CopyWithImpl(this._self, this._then);

  final _Auth1 _self;
  final $Res Function(_Auth1) _then;

/// Create a copy of Auth1
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authToken = null,Object? keyOffset = null,Object? keyLength = null,}) {
  return _then(_Auth1(
authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,keyOffset: null == keyOffset ? _self.keyOffset : keyOffset // ignore: cast_nullable_to_non_nullable
as int,keyLength: null == keyLength ? _self.keyLength : keyLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
