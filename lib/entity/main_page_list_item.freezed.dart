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
  String get imageUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get info1 => throw _privateConstructorUsedError;
  String get info2 => throw _privateConstructorUsedError;

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
  $Res call({String imageUrl, String title, String info1, String info2});
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
    Object? imageUrl = null,
    Object? title = null,
    Object? info1 = null,
    Object? info2 = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      info1: null == info1
          ? _value.info1
          : info1 // ignore: cast_nullable_to_non_nullable
              as String,
      info2: null == info2
          ? _value.info2
          : info2 // ignore: cast_nullable_to_non_nullable
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
  $Res call({String imageUrl, String title, String info1, String info2});
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
    Object? imageUrl = null,
    Object? title = null,
    Object? info1 = null,
    Object? info2 = null,
  }) {
    return _then(_$_MainPageListItem(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      info1: null == info1
          ? _value.info1
          : info1 // ignore: cast_nullable_to_non_nullable
              as String,
      info2: null == info2
          ? _value.info2
          : info2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MainPageListItem implements _MainPageListItem {
  _$_MainPageListItem(
      {required this.imageUrl,
      required this.title,
      required this.info1,
      required this.info2});

  @override
  final String imageUrl;
  @override
  final String title;
  @override
  final String info1;
  @override
  final String info2;

  @override
  String toString() {
    return 'MainPageListItem(imageUrl: $imageUrl, title: $title, info1: $info1, info2: $info2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainPageListItem &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.info1, info1) || other.info1 == info1) &&
            (identical(other.info2, info2) || other.info2 == info2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, title, info1, info2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainPageListItemCopyWith<_$_MainPageListItem> get copyWith =>
      __$$_MainPageListItemCopyWithImpl<_$_MainPageListItem>(this, _$identity);
}

abstract class _MainPageListItem implements MainPageListItem {
  factory _MainPageListItem(
      {required final String imageUrl,
      required final String title,
      required final String info1,
      required final String info2}) = _$_MainPageListItem;

  @override
  String get imageUrl;
  @override
  String get title;
  @override
  String get info1;
  @override
  String get info2;
  @override
  @JsonKey(ignore: true)
  _$$_MainPageListItemCopyWith<_$_MainPageListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
