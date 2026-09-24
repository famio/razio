// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Search _$SearchFromJson(Map<String, dynamic> json) {
  return _Search.fromJson(json);
}

/// @nodoc
mixin _$Search {
  List<SearchProgram> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCopyWith<Search> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) then) =
      _$SearchCopyWithImpl<$Res, Search>;
  @useResult
  $Res call({List<SearchProgram> data});
}

/// @nodoc
class _$SearchCopyWithImpl<$Res, $Val extends Search>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchProgram>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchProgram> data});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SearchCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SearchImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchProgram>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchImpl implements _Search {
  _$SearchImpl({required final List<SearchProgram> data}) : _data = data;

  factory _$SearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchImplFromJson(json);

  final List<SearchProgram> _data;
  @override
  List<SearchProgram> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Search(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchImplToJson(
      this,
    );
  }
}

abstract class _Search implements Search {
  factory _Search({required final List<SearchProgram> data}) = _$SearchImpl;

  factory _Search.fromJson(Map<String, dynamic> json) = _$SearchImpl.fromJson;

  @override
  List<SearchProgram> get data;
  @override
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchProgram _$SearchProgramFromJson(Map<String, dynamic> json) {
  return _SearchProgram.fromJson(json);
}

/// @nodoc
mixin _$SearchProgram {
  int get tsInNg => throw _privateConstructorUsedError;
  List<SearchProgramMeta> get metas => throw _privateConstructorUsedError;
  int get tsOutNg => throw _privateConstructorUsedError;
  String get stationId => throw _privateConstructorUsedError;
  Uri get programUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get startTimeS => throw _privateConstructorUsedError;
  SearchProgramGenre get genre => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get endTimeS => throw _privateConstructorUsedError;
  String get performer => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get programDate => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;
  Uri get img => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchProgramCopyWith<SearchProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProgramCopyWith<$Res> {
  factory $SearchProgramCopyWith(
          SearchProgram value, $Res Function(SearchProgram) then) =
      _$SearchProgramCopyWithImpl<$Res, SearchProgram>;
  @useResult
  $Res call(
      {int tsInNg,
      List<SearchProgramMeta> metas,
      int tsOutNg,
      String stationId,
      Uri programUrl,
      String status,
      String startTimeS,
      SearchProgramGenre genre,
      String title,
      String endTimeS,
      String performer,
      DateTime startTime,
      DateTime endTime,
      String programDate,
      String info,
      Uri img,
      String description});

  $SearchProgramGenreCopyWith<$Res> get genre;
}

/// @nodoc
class _$SearchProgramCopyWithImpl<$Res, $Val extends SearchProgram>
    implements $SearchProgramCopyWith<$Res> {
  _$SearchProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tsInNg = null,
    Object? metas = null,
    Object? tsOutNg = null,
    Object? stationId = null,
    Object? programUrl = null,
    Object? status = null,
    Object? startTimeS = null,
    Object? genre = null,
    Object? title = null,
    Object? endTimeS = null,
    Object? performer = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? programDate = null,
    Object? info = null,
    Object? img = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      tsInNg: null == tsInNg
          ? _value.tsInNg
          : tsInNg // ignore: cast_nullable_to_non_nullable
              as int,
      metas: null == metas
          ? _value.metas
          : metas // ignore: cast_nullable_to_non_nullable
              as List<SearchProgramMeta>,
      tsOutNg: null == tsOutNg
          ? _value.tsOutNg
          : tsOutNg // ignore: cast_nullable_to_non_nullable
              as int,
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      programUrl: null == programUrl
          ? _value.programUrl
          : programUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startTimeS: null == startTimeS
          ? _value.startTimeS
          : startTimeS // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as SearchProgramGenre,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      endTimeS: null == endTimeS
          ? _value.endTimeS
          : endTimeS // ignore: cast_nullable_to_non_nullable
              as String,
      performer: null == performer
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      programDate: null == programDate
          ? _value.programDate
          : programDate // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as Uri,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchProgramGenreCopyWith<$Res> get genre {
    return $SearchProgramGenreCopyWith<$Res>(_value.genre, (value) {
      return _then(_value.copyWith(genre: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchProgramImplCopyWith<$Res>
    implements $SearchProgramCopyWith<$Res> {
  factory _$$SearchProgramImplCopyWith(
          _$SearchProgramImpl value, $Res Function(_$SearchProgramImpl) then) =
      __$$SearchProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tsInNg,
      List<SearchProgramMeta> metas,
      int tsOutNg,
      String stationId,
      Uri programUrl,
      String status,
      String startTimeS,
      SearchProgramGenre genre,
      String title,
      String endTimeS,
      String performer,
      DateTime startTime,
      DateTime endTime,
      String programDate,
      String info,
      Uri img,
      String description});

  @override
  $SearchProgramGenreCopyWith<$Res> get genre;
}

/// @nodoc
class __$$SearchProgramImplCopyWithImpl<$Res>
    extends _$SearchProgramCopyWithImpl<$Res, _$SearchProgramImpl>
    implements _$$SearchProgramImplCopyWith<$Res> {
  __$$SearchProgramImplCopyWithImpl(
      _$SearchProgramImpl _value, $Res Function(_$SearchProgramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tsInNg = null,
    Object? metas = null,
    Object? tsOutNg = null,
    Object? stationId = null,
    Object? programUrl = null,
    Object? status = null,
    Object? startTimeS = null,
    Object? genre = null,
    Object? title = null,
    Object? endTimeS = null,
    Object? performer = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? programDate = null,
    Object? info = null,
    Object? img = null,
    Object? description = null,
  }) {
    return _then(_$SearchProgramImpl(
      tsInNg: null == tsInNg
          ? _value.tsInNg
          : tsInNg // ignore: cast_nullable_to_non_nullable
              as int,
      metas: null == metas
          ? _value._metas
          : metas // ignore: cast_nullable_to_non_nullable
              as List<SearchProgramMeta>,
      tsOutNg: null == tsOutNg
          ? _value.tsOutNg
          : tsOutNg // ignore: cast_nullable_to_non_nullable
              as int,
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      programUrl: null == programUrl
          ? _value.programUrl
          : programUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startTimeS: null == startTimeS
          ? _value.startTimeS
          : startTimeS // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as SearchProgramGenre,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      endTimeS: null == endTimeS
          ? _value.endTimeS
          : endTimeS // ignore: cast_nullable_to_non_nullable
              as String,
      performer: null == performer
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      programDate: null == programDate
          ? _value.programDate
          : programDate // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as Uri,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchProgramImpl implements _SearchProgram {
  _$SearchProgramImpl(
      {required this.tsInNg,
      required final List<SearchProgramMeta> metas,
      required this.tsOutNg,
      required this.stationId,
      required this.programUrl,
      required this.status,
      required this.startTimeS,
      required this.genre,
      required this.title,
      required this.endTimeS,
      required this.performer,
      required this.startTime,
      required this.endTime,
      required this.programDate,
      required this.info,
      required this.img,
      required this.description})
      : _metas = metas;

  factory _$SearchProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchProgramImplFromJson(json);

  @override
  final int tsInNg;
  final List<SearchProgramMeta> _metas;
  @override
  List<SearchProgramMeta> get metas {
    if (_metas is EqualUnmodifiableListView) return _metas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metas);
  }

  @override
  final int tsOutNg;
  @override
  final String stationId;
  @override
  final Uri programUrl;
  @override
  final String status;
  @override
  final String startTimeS;
  @override
  final SearchProgramGenre genre;
  @override
  final String title;
  @override
  final String endTimeS;
  @override
  final String performer;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String programDate;
  @override
  final String info;
  @override
  final Uri img;
  @override
  final String description;

  @override
  String toString() {
    return 'SearchProgram(tsInNg: $tsInNg, metas: $metas, tsOutNg: $tsOutNg, stationId: $stationId, programUrl: $programUrl, status: $status, startTimeS: $startTimeS, genre: $genre, title: $title, endTimeS: $endTimeS, performer: $performer, startTime: $startTime, endTime: $endTime, programDate: $programDate, info: $info, img: $img, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProgramImpl &&
            (identical(other.tsInNg, tsInNg) || other.tsInNg == tsInNg) &&
            const DeepCollectionEquality().equals(other._metas, _metas) &&
            (identical(other.tsOutNg, tsOutNg) || other.tsOutNg == tsOutNg) &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.programUrl, programUrl) ||
                other.programUrl == programUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTimeS, startTimeS) ||
                other.startTimeS == startTimeS) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.endTimeS, endTimeS) ||
                other.endTimeS == endTimeS) &&
            (identical(other.performer, performer) ||
                other.performer == performer) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.programDate, programDate) ||
                other.programDate == programDate) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tsInNg,
      const DeepCollectionEquality().hash(_metas),
      tsOutNg,
      stationId,
      programUrl,
      status,
      startTimeS,
      genre,
      title,
      endTimeS,
      performer,
      startTime,
      endTime,
      programDate,
      info,
      img,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProgramImplCopyWith<_$SearchProgramImpl> get copyWith =>
      __$$SearchProgramImplCopyWithImpl<_$SearchProgramImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchProgramImplToJson(
      this,
    );
  }
}

abstract class _SearchProgram implements SearchProgram {
  factory _SearchProgram(
      {required final int tsInNg,
      required final List<SearchProgramMeta> metas,
      required final int tsOutNg,
      required final String stationId,
      required final Uri programUrl,
      required final String status,
      required final String startTimeS,
      required final SearchProgramGenre genre,
      required final String title,
      required final String endTimeS,
      required final String performer,
      required final DateTime startTime,
      required final DateTime endTime,
      required final String programDate,
      required final String info,
      required final Uri img,
      required final String description}) = _$SearchProgramImpl;

  factory _SearchProgram.fromJson(Map<String, dynamic> json) =
      _$SearchProgramImpl.fromJson;

  @override
  int get tsInNg;
  @override
  List<SearchProgramMeta> get metas;
  @override
  int get tsOutNg;
  @override
  String get stationId;
  @override
  Uri get programUrl;
  @override
  String get status;
  @override
  String get startTimeS;
  @override
  SearchProgramGenre get genre;
  @override
  String get title;
  @override
  String get endTimeS;
  @override
  String get performer;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get programDate;
  @override
  String get info;
  @override
  Uri get img;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$SearchProgramImplCopyWith<_$SearchProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchProgramMeta _$SearchProgramMetaFromJson(Map<String, dynamic> json) {
  return _SearchProgramMeta.fromJson(json);
}

/// @nodoc
mixin _$SearchProgramMeta {
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchProgramMetaCopyWith<SearchProgramMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProgramMetaCopyWith<$Res> {
  factory $SearchProgramMetaCopyWith(
          SearchProgramMeta value, $Res Function(SearchProgramMeta) then) =
      _$SearchProgramMetaCopyWithImpl<$Res, SearchProgramMeta>;
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class _$SearchProgramMetaCopyWithImpl<$Res, $Val extends SearchProgramMeta>
    implements $SearchProgramMetaCopyWith<$Res> {
  _$SearchProgramMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchProgramMetaImplCopyWith<$Res>
    implements $SearchProgramMetaCopyWith<$Res> {
  factory _$$SearchProgramMetaImplCopyWith(_$SearchProgramMetaImpl value,
          $Res Function(_$SearchProgramMetaImpl) then) =
      __$$SearchProgramMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class __$$SearchProgramMetaImplCopyWithImpl<$Res>
    extends _$SearchProgramMetaCopyWithImpl<$Res, _$SearchProgramMetaImpl>
    implements _$$SearchProgramMetaImplCopyWith<$Res> {
  __$$SearchProgramMetaImplCopyWithImpl(_$SearchProgramMetaImpl _value,
      $Res Function(_$SearchProgramMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$SearchProgramMetaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchProgramMetaImpl implements _SearchProgramMeta {
  _$SearchProgramMetaImpl({required this.name, required this.value});

  factory _$SearchProgramMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchProgramMetaImplFromJson(json);

  @override
  final String name;
  @override
  final String value;

  @override
  String toString() {
    return 'SearchProgramMeta(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProgramMetaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProgramMetaImplCopyWith<_$SearchProgramMetaImpl> get copyWith =>
      __$$SearchProgramMetaImplCopyWithImpl<_$SearchProgramMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchProgramMetaImplToJson(
      this,
    );
  }
}

abstract class _SearchProgramMeta implements SearchProgramMeta {
  factory _SearchProgramMeta(
      {required final String name,
      required final String value}) = _$SearchProgramMetaImpl;

  factory _SearchProgramMeta.fromJson(Map<String, dynamic> json) =
      _$SearchProgramMetaImpl.fromJson;

  @override
  String get name;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$SearchProgramMetaImplCopyWith<_$SearchProgramMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchProgramGenre _$SearchProgramGenreFromJson(Map<String, dynamic> json) {
  return _SearchProgramGenre.fromJson(json);
}

/// @nodoc
mixin _$SearchProgramGenre {
  SearchProgramGenreData? get personality => throw _privateConstructorUsedError;
  SearchProgramGenreData? get program => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchProgramGenreCopyWith<SearchProgramGenre> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProgramGenreCopyWith<$Res> {
  factory $SearchProgramGenreCopyWith(
          SearchProgramGenre value, $Res Function(SearchProgramGenre) then) =
      _$SearchProgramGenreCopyWithImpl<$Res, SearchProgramGenre>;
  @useResult
  $Res call(
      {SearchProgramGenreData? personality, SearchProgramGenreData? program});

  $SearchProgramGenreDataCopyWith<$Res>? get personality;
  $SearchProgramGenreDataCopyWith<$Res>? get program;
}

/// @nodoc
class _$SearchProgramGenreCopyWithImpl<$Res, $Val extends SearchProgramGenre>
    implements $SearchProgramGenreCopyWith<$Res> {
  _$SearchProgramGenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personality = freezed,
    Object? program = freezed,
  }) {
    return _then(_value.copyWith(
      personality: freezed == personality
          ? _value.personality
          : personality // ignore: cast_nullable_to_non_nullable
              as SearchProgramGenreData?,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as SearchProgramGenreData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchProgramGenreDataCopyWith<$Res>? get personality {
    if (_value.personality == null) {
      return null;
    }

    return $SearchProgramGenreDataCopyWith<$Res>(_value.personality!, (value) {
      return _then(_value.copyWith(personality: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchProgramGenreDataCopyWith<$Res>? get program {
    if (_value.program == null) {
      return null;
    }

    return $SearchProgramGenreDataCopyWith<$Res>(_value.program!, (value) {
      return _then(_value.copyWith(program: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchProgramGenreImplCopyWith<$Res>
    implements $SearchProgramGenreCopyWith<$Res> {
  factory _$$SearchProgramGenreImplCopyWith(_$SearchProgramGenreImpl value,
          $Res Function(_$SearchProgramGenreImpl) then) =
      __$$SearchProgramGenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchProgramGenreData? personality, SearchProgramGenreData? program});

  @override
  $SearchProgramGenreDataCopyWith<$Res>? get personality;
  @override
  $SearchProgramGenreDataCopyWith<$Res>? get program;
}

/// @nodoc
class __$$SearchProgramGenreImplCopyWithImpl<$Res>
    extends _$SearchProgramGenreCopyWithImpl<$Res, _$SearchProgramGenreImpl>
    implements _$$SearchProgramGenreImplCopyWith<$Res> {
  __$$SearchProgramGenreImplCopyWithImpl(_$SearchProgramGenreImpl _value,
      $Res Function(_$SearchProgramGenreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personality = freezed,
    Object? program = freezed,
  }) {
    return _then(_$SearchProgramGenreImpl(
      personality: freezed == personality
          ? _value.personality
          : personality // ignore: cast_nullable_to_non_nullable
              as SearchProgramGenreData?,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as SearchProgramGenreData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchProgramGenreImpl implements _SearchProgramGenre {
  _$SearchProgramGenreImpl({this.personality, this.program});

  factory _$SearchProgramGenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchProgramGenreImplFromJson(json);

  @override
  final SearchProgramGenreData? personality;
  @override
  final SearchProgramGenreData? program;

  @override
  String toString() {
    return 'SearchProgramGenre(personality: $personality, program: $program)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProgramGenreImpl &&
            (identical(other.personality, personality) ||
                other.personality == personality) &&
            (identical(other.program, program) || other.program == program));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personality, program);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProgramGenreImplCopyWith<_$SearchProgramGenreImpl> get copyWith =>
      __$$SearchProgramGenreImplCopyWithImpl<_$SearchProgramGenreImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchProgramGenreImplToJson(
      this,
    );
  }
}

abstract class _SearchProgramGenre implements SearchProgramGenre {
  factory _SearchProgramGenre(
      {final SearchProgramGenreData? personality,
      final SearchProgramGenreData? program}) = _$SearchProgramGenreImpl;

  factory _SearchProgramGenre.fromJson(Map<String, dynamic> json) =
      _$SearchProgramGenreImpl.fromJson;

  @override
  SearchProgramGenreData? get personality;
  @override
  SearchProgramGenreData? get program;
  @override
  @JsonKey(ignore: true)
  _$$SearchProgramGenreImplCopyWith<_$SearchProgramGenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchProgramGenreData _$SearchProgramGenreDataFromJson(
    Map<String, dynamic> json) {
  return _SearchProgramGenreData.fromJson(json);
}

/// @nodoc
mixin _$SearchProgramGenreData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchProgramGenreDataCopyWith<SearchProgramGenreData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProgramGenreDataCopyWith<$Res> {
  factory $SearchProgramGenreDataCopyWith(SearchProgramGenreData value,
          $Res Function(SearchProgramGenreData) then) =
      _$SearchProgramGenreDataCopyWithImpl<$Res, SearchProgramGenreData>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$SearchProgramGenreDataCopyWithImpl<$Res,
        $Val extends SearchProgramGenreData>
    implements $SearchProgramGenreDataCopyWith<$Res> {
  _$SearchProgramGenreDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchProgramGenreDataImplCopyWith<$Res>
    implements $SearchProgramGenreDataCopyWith<$Res> {
  factory _$$SearchProgramGenreDataImplCopyWith(
          _$SearchProgramGenreDataImpl value,
          $Res Function(_$SearchProgramGenreDataImpl) then) =
      __$$SearchProgramGenreDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$SearchProgramGenreDataImplCopyWithImpl<$Res>
    extends _$SearchProgramGenreDataCopyWithImpl<$Res,
        _$SearchProgramGenreDataImpl>
    implements _$$SearchProgramGenreDataImplCopyWith<$Res> {
  __$$SearchProgramGenreDataImplCopyWithImpl(
      _$SearchProgramGenreDataImpl _value,
      $Res Function(_$SearchProgramGenreDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SearchProgramGenreDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchProgramGenreDataImpl implements _SearchProgramGenreData {
  _$SearchProgramGenreDataImpl({required this.id, required this.name});

  factory _$SearchProgramGenreDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchProgramGenreDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'SearchProgramGenreData(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProgramGenreDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProgramGenreDataImplCopyWith<_$SearchProgramGenreDataImpl>
      get copyWith => __$$SearchProgramGenreDataImplCopyWithImpl<
          _$SearchProgramGenreDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchProgramGenreDataImplToJson(
      this,
    );
  }
}

abstract class _SearchProgramGenreData implements SearchProgramGenreData {
  factory _SearchProgramGenreData(
      {required final String id,
      required final String name}) = _$SearchProgramGenreDataImpl;

  factory _SearchProgramGenreData.fromJson(Map<String, dynamic> json) =
      _$SearchProgramGenreDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SearchProgramGenreDataImplCopyWith<_$SearchProgramGenreDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
