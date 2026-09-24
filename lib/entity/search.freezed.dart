// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Search {

 List<SearchProgram> get data;
/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCopyWith<Search> get copyWith => _$SearchCopyWithImpl<Search>(this as Search, _$identity);

  /// Serializes this Search to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Search&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Search(data: $data)';
}


}

/// @nodoc
abstract mixin class $SearchCopyWith<$Res>  {
  factory $SearchCopyWith(Search value, $Res Function(Search) _then) = _$SearchCopyWithImpl;
@useResult
$Res call({
 List<SearchProgram> data
});




}
/// @nodoc
class _$SearchCopyWithImpl<$Res>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._self, this._then);

  final Search _self;
  final $Res Function(Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SearchProgram>,
  ));
}

}


/// Adds pattern-matching-related methods to [Search].
extension SearchPatterns on Search {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Search value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Search() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Search value)  $default,){
final _that = this;
switch (_that) {
case _Search():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Search value)?  $default,){
final _that = this;
switch (_that) {
case _Search() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchProgram> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Search() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchProgram> data)  $default,) {final _that = this;
switch (_that) {
case _Search():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchProgram> data)?  $default,) {final _that = this;
switch (_that) {
case _Search() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Search implements Search {
   _Search({required final  List<SearchProgram> data}): _data = data;
  factory _Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

 final  List<SearchProgram> _data;
@override List<SearchProgram> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'Search(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@override @useResult
$Res call({
 List<SearchProgram> data
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Search(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SearchProgram>,
  ));
}


}


/// @nodoc
mixin _$SearchProgram {

 int get tsInNg; List<SearchProgramMeta> get metas; int get tsOutNg; String get stationId; Uri get programUrl; String get status; String get startTimeS; SearchProgramGenre get genre; String get title; String get endTimeS; String get performer; DateTime get startTime; DateTime get endTime; String get programDate; String get info; Uri get img; String get description;
/// Create a copy of SearchProgram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProgramCopyWith<SearchProgram> get copyWith => _$SearchProgramCopyWithImpl<SearchProgram>(this as SearchProgram, _$identity);

  /// Serializes this SearchProgram to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProgram&&(identical(other.tsInNg, tsInNg) || other.tsInNg == tsInNg)&&const DeepCollectionEquality().equals(other.metas, metas)&&(identical(other.tsOutNg, tsOutNg) || other.tsOutNg == tsOutNg)&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.programUrl, programUrl) || other.programUrl == programUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTimeS, startTimeS) || other.startTimeS == startTimeS)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.title, title) || other.title == title)&&(identical(other.endTimeS, endTimeS) || other.endTimeS == endTimeS)&&(identical(other.performer, performer) || other.performer == performer)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.programDate, programDate) || other.programDate == programDate)&&(identical(other.info, info) || other.info == info)&&(identical(other.img, img) || other.img == img)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tsInNg,const DeepCollectionEquality().hash(metas),tsOutNg,stationId,programUrl,status,startTimeS,genre,title,endTimeS,performer,startTime,endTime,programDate,info,img,description);

@override
String toString() {
  return 'SearchProgram(tsInNg: $tsInNg, metas: $metas, tsOutNg: $tsOutNg, stationId: $stationId, programUrl: $programUrl, status: $status, startTimeS: $startTimeS, genre: $genre, title: $title, endTimeS: $endTimeS, performer: $performer, startTime: $startTime, endTime: $endTime, programDate: $programDate, info: $info, img: $img, description: $description)';
}


}

/// @nodoc
abstract mixin class $SearchProgramCopyWith<$Res>  {
  factory $SearchProgramCopyWith(SearchProgram value, $Res Function(SearchProgram) _then) = _$SearchProgramCopyWithImpl;
@useResult
$Res call({
 int tsInNg, List<SearchProgramMeta> metas, int tsOutNg, String stationId, Uri programUrl, String status, String startTimeS, SearchProgramGenre genre, String title, String endTimeS, String performer, DateTime startTime, DateTime endTime, String programDate, String info, Uri img, String description
});


$SearchProgramGenreCopyWith<$Res> get genre;

}
/// @nodoc
class _$SearchProgramCopyWithImpl<$Res>
    implements $SearchProgramCopyWith<$Res> {
  _$SearchProgramCopyWithImpl(this._self, this._then);

  final SearchProgram _self;
  final $Res Function(SearchProgram) _then;

/// Create a copy of SearchProgram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tsInNg = null,Object? metas = null,Object? tsOutNg = null,Object? stationId = null,Object? programUrl = null,Object? status = null,Object? startTimeS = null,Object? genre = null,Object? title = null,Object? endTimeS = null,Object? performer = null,Object? startTime = null,Object? endTime = null,Object? programDate = null,Object? info = null,Object? img = null,Object? description = null,}) {
  return _then(_self.copyWith(
tsInNg: null == tsInNg ? _self.tsInNg : tsInNg // ignore: cast_nullable_to_non_nullable
as int,metas: null == metas ? _self.metas : metas // ignore: cast_nullable_to_non_nullable
as List<SearchProgramMeta>,tsOutNg: null == tsOutNg ? _self.tsOutNg : tsOutNg // ignore: cast_nullable_to_non_nullable
as int,stationId: null == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as String,programUrl: null == programUrl ? _self.programUrl : programUrl // ignore: cast_nullable_to_non_nullable
as Uri,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTimeS: null == startTimeS ? _self.startTimeS : startTimeS // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as SearchProgramGenre,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,endTimeS: null == endTimeS ? _self.endTimeS : endTimeS // ignore: cast_nullable_to_non_nullable
as String,performer: null == performer ? _self.performer : performer // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,programDate: null == programDate ? _self.programDate : programDate // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as Uri,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SearchProgram
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchProgramGenreCopyWith<$Res> get genre {
  
  return $SearchProgramGenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchProgram].
extension SearchProgramPatterns on SearchProgram {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProgram value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProgram() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProgram value)  $default,){
final _that = this;
switch (_that) {
case _SearchProgram():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProgram value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProgram() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tsInNg,  List<SearchProgramMeta> metas,  int tsOutNg,  String stationId,  Uri programUrl,  String status,  String startTimeS,  SearchProgramGenre genre,  String title,  String endTimeS,  String performer,  DateTime startTime,  DateTime endTime,  String programDate,  String info,  Uri img,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProgram() when $default != null:
return $default(_that.tsInNg,_that.metas,_that.tsOutNg,_that.stationId,_that.programUrl,_that.status,_that.startTimeS,_that.genre,_that.title,_that.endTimeS,_that.performer,_that.startTime,_that.endTime,_that.programDate,_that.info,_that.img,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tsInNg,  List<SearchProgramMeta> metas,  int tsOutNg,  String stationId,  Uri programUrl,  String status,  String startTimeS,  SearchProgramGenre genre,  String title,  String endTimeS,  String performer,  DateTime startTime,  DateTime endTime,  String programDate,  String info,  Uri img,  String description)  $default,) {final _that = this;
switch (_that) {
case _SearchProgram():
return $default(_that.tsInNg,_that.metas,_that.tsOutNg,_that.stationId,_that.programUrl,_that.status,_that.startTimeS,_that.genre,_that.title,_that.endTimeS,_that.performer,_that.startTime,_that.endTime,_that.programDate,_that.info,_that.img,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tsInNg,  List<SearchProgramMeta> metas,  int tsOutNg,  String stationId,  Uri programUrl,  String status,  String startTimeS,  SearchProgramGenre genre,  String title,  String endTimeS,  String performer,  DateTime startTime,  DateTime endTime,  String programDate,  String info,  Uri img,  String description)?  $default,) {final _that = this;
switch (_that) {
case _SearchProgram() when $default != null:
return $default(_that.tsInNg,_that.metas,_that.tsOutNg,_that.stationId,_that.programUrl,_that.status,_that.startTimeS,_that.genre,_that.title,_that.endTimeS,_that.performer,_that.startTime,_that.endTime,_that.programDate,_that.info,_that.img,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProgram implements SearchProgram {
   _SearchProgram({required this.tsInNg, required final  List<SearchProgramMeta> metas, required this.tsOutNg, required this.stationId, required this.programUrl, required this.status, required this.startTimeS, required this.genre, required this.title, required this.endTimeS, required this.performer, required this.startTime, required this.endTime, required this.programDate, required this.info, required this.img, required this.description}): _metas = metas;
  factory _SearchProgram.fromJson(Map<String, dynamic> json) => _$SearchProgramFromJson(json);

@override final  int tsInNg;
 final  List<SearchProgramMeta> _metas;
@override List<SearchProgramMeta> get metas {
  if (_metas is EqualUnmodifiableListView) return _metas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_metas);
}

@override final  int tsOutNg;
@override final  String stationId;
@override final  Uri programUrl;
@override final  String status;
@override final  String startTimeS;
@override final  SearchProgramGenre genre;
@override final  String title;
@override final  String endTimeS;
@override final  String performer;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override final  String programDate;
@override final  String info;
@override final  Uri img;
@override final  String description;

/// Create a copy of SearchProgram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProgramCopyWith<_SearchProgram> get copyWith => __$SearchProgramCopyWithImpl<_SearchProgram>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProgramToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProgram&&(identical(other.tsInNg, tsInNg) || other.tsInNg == tsInNg)&&const DeepCollectionEquality().equals(other._metas, _metas)&&(identical(other.tsOutNg, tsOutNg) || other.tsOutNg == tsOutNg)&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.programUrl, programUrl) || other.programUrl == programUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTimeS, startTimeS) || other.startTimeS == startTimeS)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.title, title) || other.title == title)&&(identical(other.endTimeS, endTimeS) || other.endTimeS == endTimeS)&&(identical(other.performer, performer) || other.performer == performer)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.programDate, programDate) || other.programDate == programDate)&&(identical(other.info, info) || other.info == info)&&(identical(other.img, img) || other.img == img)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tsInNg,const DeepCollectionEquality().hash(_metas),tsOutNg,stationId,programUrl,status,startTimeS,genre,title,endTimeS,performer,startTime,endTime,programDate,info,img,description);

@override
String toString() {
  return 'SearchProgram(tsInNg: $tsInNg, metas: $metas, tsOutNg: $tsOutNg, stationId: $stationId, programUrl: $programUrl, status: $status, startTimeS: $startTimeS, genre: $genre, title: $title, endTimeS: $endTimeS, performer: $performer, startTime: $startTime, endTime: $endTime, programDate: $programDate, info: $info, img: $img, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SearchProgramCopyWith<$Res> implements $SearchProgramCopyWith<$Res> {
  factory _$SearchProgramCopyWith(_SearchProgram value, $Res Function(_SearchProgram) _then) = __$SearchProgramCopyWithImpl;
@override @useResult
$Res call({
 int tsInNg, List<SearchProgramMeta> metas, int tsOutNg, String stationId, Uri programUrl, String status, String startTimeS, SearchProgramGenre genre, String title, String endTimeS, String performer, DateTime startTime, DateTime endTime, String programDate, String info, Uri img, String description
});


@override $SearchProgramGenreCopyWith<$Res> get genre;

}
/// @nodoc
class __$SearchProgramCopyWithImpl<$Res>
    implements _$SearchProgramCopyWith<$Res> {
  __$SearchProgramCopyWithImpl(this._self, this._then);

  final _SearchProgram _self;
  final $Res Function(_SearchProgram) _then;

/// Create a copy of SearchProgram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tsInNg = null,Object? metas = null,Object? tsOutNg = null,Object? stationId = null,Object? programUrl = null,Object? status = null,Object? startTimeS = null,Object? genre = null,Object? title = null,Object? endTimeS = null,Object? performer = null,Object? startTime = null,Object? endTime = null,Object? programDate = null,Object? info = null,Object? img = null,Object? description = null,}) {
  return _then(_SearchProgram(
tsInNg: null == tsInNg ? _self.tsInNg : tsInNg // ignore: cast_nullable_to_non_nullable
as int,metas: null == metas ? _self._metas : metas // ignore: cast_nullable_to_non_nullable
as List<SearchProgramMeta>,tsOutNg: null == tsOutNg ? _self.tsOutNg : tsOutNg // ignore: cast_nullable_to_non_nullable
as int,stationId: null == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as String,programUrl: null == programUrl ? _self.programUrl : programUrl // ignore: cast_nullable_to_non_nullable
as Uri,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTimeS: null == startTimeS ? _self.startTimeS : startTimeS // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as SearchProgramGenre,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,endTimeS: null == endTimeS ? _self.endTimeS : endTimeS // ignore: cast_nullable_to_non_nullable
as String,performer: null == performer ? _self.performer : performer // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,programDate: null == programDate ? _self.programDate : programDate // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as Uri,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SearchProgram
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchProgramGenreCopyWith<$Res> get genre {
  
  return $SearchProgramGenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// @nodoc
mixin _$SearchProgramMeta {

 String get name; String get value;
/// Create a copy of SearchProgramMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProgramMetaCopyWith<SearchProgramMeta> get copyWith => _$SearchProgramMetaCopyWithImpl<SearchProgramMeta>(this as SearchProgramMeta, _$identity);

  /// Serializes this SearchProgramMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProgramMeta&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'SearchProgramMeta(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class $SearchProgramMetaCopyWith<$Res>  {
  factory $SearchProgramMetaCopyWith(SearchProgramMeta value, $Res Function(SearchProgramMeta) _then) = _$SearchProgramMetaCopyWithImpl;
@useResult
$Res call({
 String name, String value
});




}
/// @nodoc
class _$SearchProgramMetaCopyWithImpl<$Res>
    implements $SearchProgramMetaCopyWith<$Res> {
  _$SearchProgramMetaCopyWithImpl(this._self, this._then);

  final SearchProgramMeta _self;
  final $Res Function(SearchProgramMeta) _then;

/// Create a copy of SearchProgramMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchProgramMeta].
extension SearchProgramMetaPatterns on SearchProgramMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProgramMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProgramMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProgramMeta value)  $default,){
final _that = this;
switch (_that) {
case _SearchProgramMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProgramMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProgramMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProgramMeta() when $default != null:
return $default(_that.name,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String value)  $default,) {final _that = this;
switch (_that) {
case _SearchProgramMeta():
return $default(_that.name,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SearchProgramMeta() when $default != null:
return $default(_that.name,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProgramMeta implements SearchProgramMeta {
   _SearchProgramMeta({required this.name, required this.value});
  factory _SearchProgramMeta.fromJson(Map<String, dynamic> json) => _$SearchProgramMetaFromJson(json);

@override final  String name;
@override final  String value;

/// Create a copy of SearchProgramMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProgramMetaCopyWith<_SearchProgramMeta> get copyWith => __$SearchProgramMetaCopyWithImpl<_SearchProgramMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProgramMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProgramMeta&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'SearchProgramMeta(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SearchProgramMetaCopyWith<$Res> implements $SearchProgramMetaCopyWith<$Res> {
  factory _$SearchProgramMetaCopyWith(_SearchProgramMeta value, $Res Function(_SearchProgramMeta) _then) = __$SearchProgramMetaCopyWithImpl;
@override @useResult
$Res call({
 String name, String value
});




}
/// @nodoc
class __$SearchProgramMetaCopyWithImpl<$Res>
    implements _$SearchProgramMetaCopyWith<$Res> {
  __$SearchProgramMetaCopyWithImpl(this._self, this._then);

  final _SearchProgramMeta _self;
  final $Res Function(_SearchProgramMeta) _then;

/// Create a copy of SearchProgramMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,}) {
  return _then(_SearchProgramMeta(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SearchProgramGenre {

 SearchProgramGenreData? get personality; SearchProgramGenreData? get program;
/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProgramGenreCopyWith<SearchProgramGenre> get copyWith => _$SearchProgramGenreCopyWithImpl<SearchProgramGenre>(this as SearchProgramGenre, _$identity);

  /// Serializes this SearchProgramGenre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProgramGenre&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.program, program) || other.program == program));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,personality,program);

@override
String toString() {
  return 'SearchProgramGenre(personality: $personality, program: $program)';
}


}

/// @nodoc
abstract mixin class $SearchProgramGenreCopyWith<$Res>  {
  factory $SearchProgramGenreCopyWith(SearchProgramGenre value, $Res Function(SearchProgramGenre) _then) = _$SearchProgramGenreCopyWithImpl;
@useResult
$Res call({
 SearchProgramGenreData? personality, SearchProgramGenreData? program
});


$SearchProgramGenreDataCopyWith<$Res>? get personality;$SearchProgramGenreDataCopyWith<$Res>? get program;

}
/// @nodoc
class _$SearchProgramGenreCopyWithImpl<$Res>
    implements $SearchProgramGenreCopyWith<$Res> {
  _$SearchProgramGenreCopyWithImpl(this._self, this._then);

  final SearchProgramGenre _self;
  final $Res Function(SearchProgramGenre) _then;

/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? personality = freezed,Object? program = freezed,}) {
  return _then(_self.copyWith(
personality: freezed == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as SearchProgramGenreData?,program: freezed == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as SearchProgramGenreData?,
  ));
}
/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchProgramGenreDataCopyWith<$Res>? get personality {
    if (_self.personality == null) {
    return null;
  }

  return $SearchProgramGenreDataCopyWith<$Res>(_self.personality!, (value) {
    return _then(_self.copyWith(personality: value));
  });
}/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchProgramGenreDataCopyWith<$Res>? get program {
    if (_self.program == null) {
    return null;
  }

  return $SearchProgramGenreDataCopyWith<$Res>(_self.program!, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchProgramGenre].
extension SearchProgramGenrePatterns on SearchProgramGenre {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProgramGenre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProgramGenre() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProgramGenre value)  $default,){
final _that = this;
switch (_that) {
case _SearchProgramGenre():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProgramGenre value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProgramGenre() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchProgramGenreData? personality,  SearchProgramGenreData? program)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProgramGenre() when $default != null:
return $default(_that.personality,_that.program);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchProgramGenreData? personality,  SearchProgramGenreData? program)  $default,) {final _that = this;
switch (_that) {
case _SearchProgramGenre():
return $default(_that.personality,_that.program);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchProgramGenreData? personality,  SearchProgramGenreData? program)?  $default,) {final _that = this;
switch (_that) {
case _SearchProgramGenre() when $default != null:
return $default(_that.personality,_that.program);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProgramGenre implements SearchProgramGenre {
   _SearchProgramGenre({this.personality, this.program});
  factory _SearchProgramGenre.fromJson(Map<String, dynamic> json) => _$SearchProgramGenreFromJson(json);

@override final  SearchProgramGenreData? personality;
@override final  SearchProgramGenreData? program;

/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProgramGenreCopyWith<_SearchProgramGenre> get copyWith => __$SearchProgramGenreCopyWithImpl<_SearchProgramGenre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProgramGenreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProgramGenre&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.program, program) || other.program == program));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,personality,program);

@override
String toString() {
  return 'SearchProgramGenre(personality: $personality, program: $program)';
}


}

/// @nodoc
abstract mixin class _$SearchProgramGenreCopyWith<$Res> implements $SearchProgramGenreCopyWith<$Res> {
  factory _$SearchProgramGenreCopyWith(_SearchProgramGenre value, $Res Function(_SearchProgramGenre) _then) = __$SearchProgramGenreCopyWithImpl;
@override @useResult
$Res call({
 SearchProgramGenreData? personality, SearchProgramGenreData? program
});


@override $SearchProgramGenreDataCopyWith<$Res>? get personality;@override $SearchProgramGenreDataCopyWith<$Res>? get program;

}
/// @nodoc
class __$SearchProgramGenreCopyWithImpl<$Res>
    implements _$SearchProgramGenreCopyWith<$Res> {
  __$SearchProgramGenreCopyWithImpl(this._self, this._then);

  final _SearchProgramGenre _self;
  final $Res Function(_SearchProgramGenre) _then;

/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? personality = freezed,Object? program = freezed,}) {
  return _then(_SearchProgramGenre(
personality: freezed == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as SearchProgramGenreData?,program: freezed == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as SearchProgramGenreData?,
  ));
}

/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchProgramGenreDataCopyWith<$Res>? get personality {
    if (_self.personality == null) {
    return null;
  }

  return $SearchProgramGenreDataCopyWith<$Res>(_self.personality!, (value) {
    return _then(_self.copyWith(personality: value));
  });
}/// Create a copy of SearchProgramGenre
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchProgramGenreDataCopyWith<$Res>? get program {
    if (_self.program == null) {
    return null;
  }

  return $SearchProgramGenreDataCopyWith<$Res>(_self.program!, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// @nodoc
mixin _$SearchProgramGenreData {

 String get id; String get name;
/// Create a copy of SearchProgramGenreData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProgramGenreDataCopyWith<SearchProgramGenreData> get copyWith => _$SearchProgramGenreDataCopyWithImpl<SearchProgramGenreData>(this as SearchProgramGenreData, _$identity);

  /// Serializes this SearchProgramGenreData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProgramGenreData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SearchProgramGenreData(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SearchProgramGenreDataCopyWith<$Res>  {
  factory $SearchProgramGenreDataCopyWith(SearchProgramGenreData value, $Res Function(SearchProgramGenreData) _then) = _$SearchProgramGenreDataCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$SearchProgramGenreDataCopyWithImpl<$Res>
    implements $SearchProgramGenreDataCopyWith<$Res> {
  _$SearchProgramGenreDataCopyWithImpl(this._self, this._then);

  final SearchProgramGenreData _self;
  final $Res Function(SearchProgramGenreData) _then;

/// Create a copy of SearchProgramGenreData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchProgramGenreData].
extension SearchProgramGenreDataPatterns on SearchProgramGenreData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProgramGenreData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProgramGenreData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProgramGenreData value)  $default,){
final _that = this;
switch (_that) {
case _SearchProgramGenreData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProgramGenreData value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProgramGenreData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProgramGenreData() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _SearchProgramGenreData():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SearchProgramGenreData() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProgramGenreData implements SearchProgramGenreData {
   _SearchProgramGenreData({required this.id, required this.name});
  factory _SearchProgramGenreData.fromJson(Map<String, dynamic> json) => _$SearchProgramGenreDataFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of SearchProgramGenreData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProgramGenreDataCopyWith<_SearchProgramGenreData> get copyWith => __$SearchProgramGenreDataCopyWithImpl<_SearchProgramGenreData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProgramGenreDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProgramGenreData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SearchProgramGenreData(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SearchProgramGenreDataCopyWith<$Res> implements $SearchProgramGenreDataCopyWith<$Res> {
  factory _$SearchProgramGenreDataCopyWith(_SearchProgramGenreData value, $Res Function(_SearchProgramGenreData) _then) = __$SearchProgramGenreDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$SearchProgramGenreDataCopyWithImpl<$Res>
    implements _$SearchProgramGenreDataCopyWith<$Res> {
  __$SearchProgramGenreDataCopyWithImpl(this._self, this._then);

  final _SearchProgramGenreData _self;
  final $Res Function(_SearchProgramGenreData) _then;

/// Create a copy of SearchProgramGenreData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_SearchProgramGenreData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
