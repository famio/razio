// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainPageListItem {
  String get stationName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get programDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainPageListItemCopyWith<MainPageListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageListItemCopyWith<$Res> {
  factory $MainPageListItemCopyWith(
          MainPageListItem value, $Res Function(MainPageListItem) then) =
      _$MainPageListItemCopyWithImpl<$Res, MainPageListItem>;
  @useResult
  $Res call(
      {String stationName, String imageUrl, String title, String programDate});
}

/// @nodoc
class _$MainPageListItemCopyWithImpl<$Res, $Val extends MainPageListItem>
    implements $MainPageListItemCopyWith<$Res> {
  _$MainPageListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationName = null,
    Object? imageUrl = null,
    Object? title = null,
    Object? programDate = null,
  }) {
    return _then(_value.copyWith(
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      programDate: null == programDate
          ? _value.programDate
          : programDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainPageListItemCopyWith<$Res>
    implements $MainPageListItemCopyWith<$Res> {
  factory _$$_MainPageListItemCopyWith(
          _$_MainPageListItem value, $Res Function(_$_MainPageListItem) then) =
      __$$_MainPageListItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stationName, String imageUrl, String title, String programDate});
}

/// @nodoc
class __$$_MainPageListItemCopyWithImpl<$Res>
    extends _$MainPageListItemCopyWithImpl<$Res, _$_MainPageListItem>
    implements _$$_MainPageListItemCopyWith<$Res> {
  __$$_MainPageListItemCopyWithImpl(
      _$_MainPageListItem _value, $Res Function(_$_MainPageListItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationName = null,
    Object? imageUrl = null,
    Object? title = null,
    Object? programDate = null,
  }) {
    return _then(_$_MainPageListItem(
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      programDate: null == programDate
          ? _value.programDate
          : programDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MainPageListItem implements _MainPageListItem {
  _$_MainPageListItem(
      {required this.stationName,
      required this.imageUrl,
      required this.title,
      required this.programDate});

  @override
  final String stationName;
  @override
  final String imageUrl;
  @override
  final String title;
  @override
  final String programDate;

  @override
  String toString() {
    return 'MainPageListItem(stationName: $stationName, imageUrl: $imageUrl, title: $title, programDate: $programDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainPageListItem &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.programDate, programDate) ||
                other.programDate == programDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, stationName, imageUrl, title, programDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainPageListItemCopyWith<_$_MainPageListItem> get copyWith =>
      __$$_MainPageListItemCopyWithImpl<_$_MainPageListItem>(this, _$identity);
}

abstract class _MainPageListItem implements MainPageListItem {
  factory _MainPageListItem(
      {required final String stationName,
      required final String imageUrl,
      required final String title,
      required final String programDate}) = _$_MainPageListItem;

  @override
  String get stationName;
  @override
  String get imageUrl;
  @override
  String get title;
  @override
  String get programDate;
  @override
  @JsonKey(ignore: true)
  _$$_MainPageListItemCopyWith<_$_MainPageListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
