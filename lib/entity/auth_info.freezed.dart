// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthInfo {

 String get authToken; String get areaId;
/// Create a copy of AuthInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthInfoCopyWith<AuthInfo> get copyWith => _$AuthInfoCopyWithImpl<AuthInfo>(this as AuthInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInfo&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.areaId, areaId) || other.areaId == areaId));
}


@override
int get hashCode => Object.hash(runtimeType,authToken,areaId);

@override
String toString() {
  return 'AuthInfo(authToken: $authToken, areaId: $areaId)';
}


}

/// @nodoc
abstract mixin class $AuthInfoCopyWith<$Res>  {
  factory $AuthInfoCopyWith(AuthInfo value, $Res Function(AuthInfo) _then) = _$AuthInfoCopyWithImpl;
@useResult
$Res call({
 String authToken, String areaId
});




}
/// @nodoc
class _$AuthInfoCopyWithImpl<$Res>
    implements $AuthInfoCopyWith<$Res> {
  _$AuthInfoCopyWithImpl(this._self, this._then);

  final AuthInfo _self;
  final $Res Function(AuthInfo) _then;

/// Create a copy of AuthInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authToken = null,Object? areaId = null,}) {
  return _then(_self.copyWith(
authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthInfo].
extension AuthInfoPatterns on AuthInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthInfo value)  $default,){
final _that = this;
switch (_that) {
case _AuthInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AuthInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authToken,  String areaId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthInfo() when $default != null:
return $default(_that.authToken,_that.areaId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authToken,  String areaId)  $default,) {final _that = this;
switch (_that) {
case _AuthInfo():
return $default(_that.authToken,_that.areaId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authToken,  String areaId)?  $default,) {final _that = this;
switch (_that) {
case _AuthInfo() when $default != null:
return $default(_that.authToken,_that.areaId);case _:
  return null;

}
}

}

/// @nodoc


class _AuthInfo implements AuthInfo {
   _AuthInfo({required this.authToken, required this.areaId});
  

@override final  String authToken;
@override final  String areaId;

/// Create a copy of AuthInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthInfoCopyWith<_AuthInfo> get copyWith => __$AuthInfoCopyWithImpl<_AuthInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthInfo&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.areaId, areaId) || other.areaId == areaId));
}


@override
int get hashCode => Object.hash(runtimeType,authToken,areaId);

@override
String toString() {
  return 'AuthInfo(authToken: $authToken, areaId: $areaId)';
}


}

/// @nodoc
abstract mixin class _$AuthInfoCopyWith<$Res> implements $AuthInfoCopyWith<$Res> {
  factory _$AuthInfoCopyWith(_AuthInfo value, $Res Function(_AuthInfo) _then) = __$AuthInfoCopyWithImpl;
@override @useResult
$Res call({
 String authToken, String areaId
});




}
/// @nodoc
class __$AuthInfoCopyWithImpl<$Res>
    implements _$AuthInfoCopyWith<$Res> {
  __$AuthInfoCopyWithImpl(this._self, this._then);

  final _AuthInfo _self;
  final $Res Function(_AuthInfo) _then;

/// Create a copy of AuthInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authToken = null,Object? areaId = null,}) {
  return _then(_AuthInfo(
authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
