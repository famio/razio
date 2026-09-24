// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainPageListItem {

 String get stationId; String get imageUrl; String get title; String get info1; String get info2;
/// Create a copy of MainPageListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageListItemCopyWith<MainPageListItem> get copyWith => _$MainPageListItemCopyWithImpl<MainPageListItem>(this as MainPageListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageListItem&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.info1, info1) || other.info1 == info1)&&(identical(other.info2, info2) || other.info2 == info2));
}


@override
int get hashCode => Object.hash(runtimeType,stationId,imageUrl,title,info1,info2);

@override
String toString() {
  return 'MainPageListItem(stationId: $stationId, imageUrl: $imageUrl, title: $title, info1: $info1, info2: $info2)';
}


}

/// @nodoc
abstract mixin class $MainPageListItemCopyWith<$Res>  {
  factory $MainPageListItemCopyWith(MainPageListItem value, $Res Function(MainPageListItem) _then) = _$MainPageListItemCopyWithImpl;
@useResult
$Res call({
 String stationId, String imageUrl, String title, String info1, String info2
});




}
/// @nodoc
class _$MainPageListItemCopyWithImpl<$Res>
    implements $MainPageListItemCopyWith<$Res> {
  _$MainPageListItemCopyWithImpl(this._self, this._then);

  final MainPageListItem _self;
  final $Res Function(MainPageListItem) _then;

/// Create a copy of MainPageListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationId = null,Object? imageUrl = null,Object? title = null,Object? info1 = null,Object? info2 = null,}) {
  return _then(_self.copyWith(
stationId: null == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,info1: null == info1 ? _self.info1 : info1 // ignore: cast_nullable_to_non_nullable
as String,info2: null == info2 ? _self.info2 : info2 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MainPageListItem].
extension MainPageListItemPatterns on MainPageListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainPageListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainPageListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainPageListItem value)  $default,){
final _that = this;
switch (_that) {
case _MainPageListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainPageListItem value)?  $default,){
final _that = this;
switch (_that) {
case _MainPageListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stationId,  String imageUrl,  String title,  String info1,  String info2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainPageListItem() when $default != null:
return $default(_that.stationId,_that.imageUrl,_that.title,_that.info1,_that.info2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stationId,  String imageUrl,  String title,  String info1,  String info2)  $default,) {final _that = this;
switch (_that) {
case _MainPageListItem():
return $default(_that.stationId,_that.imageUrl,_that.title,_that.info1,_that.info2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stationId,  String imageUrl,  String title,  String info1,  String info2)?  $default,) {final _that = this;
switch (_that) {
case _MainPageListItem() when $default != null:
return $default(_that.stationId,_that.imageUrl,_that.title,_that.info1,_that.info2);case _:
  return null;

}
}

}

/// @nodoc


class _MainPageListItem implements MainPageListItem {
   _MainPageListItem({required this.stationId, required this.imageUrl, required this.title, required this.info1, required this.info2});
  

@override final  String stationId;
@override final  String imageUrl;
@override final  String title;
@override final  String info1;
@override final  String info2;

/// Create a copy of MainPageListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainPageListItemCopyWith<_MainPageListItem> get copyWith => __$MainPageListItemCopyWithImpl<_MainPageListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainPageListItem&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.info1, info1) || other.info1 == info1)&&(identical(other.info2, info2) || other.info2 == info2));
}


@override
int get hashCode => Object.hash(runtimeType,stationId,imageUrl,title,info1,info2);

@override
String toString() {
  return 'MainPageListItem(stationId: $stationId, imageUrl: $imageUrl, title: $title, info1: $info1, info2: $info2)';
}


}

/// @nodoc
abstract mixin class _$MainPageListItemCopyWith<$Res> implements $MainPageListItemCopyWith<$Res> {
  factory _$MainPageListItemCopyWith(_MainPageListItem value, $Res Function(_MainPageListItem) _then) = __$MainPageListItemCopyWithImpl;
@override @useResult
$Res call({
 String stationId, String imageUrl, String title, String info1, String info2
});




}
/// @nodoc
class __$MainPageListItemCopyWithImpl<$Res>
    implements _$MainPageListItemCopyWith<$Res> {
  __$MainPageListItemCopyWithImpl(this._self, this._then);

  final _MainPageListItem _self;
  final $Res Function(_MainPageListItem) _then;

/// Create a copy of MainPageListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationId = null,Object? imageUrl = null,Object? title = null,Object? info1 = null,Object? info2 = null,}) {
  return _then(_MainPageListItem(
stationId: null == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,info1: null == info1 ? _self.info1 : info1 // ignore: cast_nullable_to_non_nullable
as String,info2: null == info2 ? _self.info2 : info2 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
