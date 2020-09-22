// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GalleryIdTearOff {
  const _$GalleryIdTearOff();

// ignore: unused_element
  _GalleryId call({@required int id, @required String token}) {
    return _GalleryId(
      id: id,
      token: token,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GalleryId = _$GalleryIdTearOff();

/// @nodoc
mixin _$GalleryId {
  int get id;
  String get token;

  $GalleryIdCopyWith<GalleryId> get copyWith;
}

/// @nodoc
abstract class $GalleryIdCopyWith<$Res> {
  factory $GalleryIdCopyWith(GalleryId value, $Res Function(GalleryId) then) =
      _$GalleryIdCopyWithImpl<$Res>;
  $Res call({int id, String token});
}

/// @nodoc
class _$GalleryIdCopyWithImpl<$Res> implements $GalleryIdCopyWith<$Res> {
  _$GalleryIdCopyWithImpl(this._value, this._then);

  final GalleryId _value;
  // ignore: unused_field
  final $Res Function(GalleryId) _then;

  @override
  $Res call({
    Object id = freezed,
    Object token = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

/// @nodoc
abstract class _$GalleryIdCopyWith<$Res> implements $GalleryIdCopyWith<$Res> {
  factory _$GalleryIdCopyWith(
          _GalleryId value, $Res Function(_GalleryId) then) =
      __$GalleryIdCopyWithImpl<$Res>;
  @override
  $Res call({int id, String token});
}

/// @nodoc
class __$GalleryIdCopyWithImpl<$Res> extends _$GalleryIdCopyWithImpl<$Res>
    implements _$GalleryIdCopyWith<$Res> {
  __$GalleryIdCopyWithImpl(_GalleryId _value, $Res Function(_GalleryId) _then)
      : super(_value, (v) => _then(v as _GalleryId));

  @override
  _GalleryId get _value => super._value as _GalleryId;

  @override
  $Res call({
    Object id = freezed,
    Object token = freezed,
  }) {
    return _then(_GalleryId(
      id: id == freezed ? _value.id : id as int,
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

/// @nodoc
class _$_GalleryId extends _GalleryId {
  const _$_GalleryId({@required this.id, @required this.token})
      : assert(id != null),
        assert(token != null),
        super._();

  @override
  final int id;
  @override
  final String token;

  @override
  String toString() {
    return 'GalleryId(id: $id, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryId &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(token);

  @override
  _$GalleryIdCopyWith<_GalleryId> get copyWith =>
      __$GalleryIdCopyWithImpl<_GalleryId>(this, _$identity);
}

abstract class _GalleryId extends GalleryId {
  const _GalleryId._() : super._();
  const factory _GalleryId({@required int id, @required String token}) =
      _$_GalleryId;

  @override
  int get id;
  @override
  String get token;
  @override
  _$GalleryIdCopyWith<_GalleryId> get copyWith;
}

/// @nodoc
class _$GalleryTearOff {
  const _$GalleryTearOff();

// ignore: unused_element
  _Gallery call(
      {@required int id,
      @required String token,
      @required String title,
      @required String titleJpn,
      @required String category,
      @required String thumbnail,
      @required String uploader,
      @required int fileCount,
      @required int fileSize,
      @required bool expunged,
      @required double rating,
      @required BuiltList<GalleryTag> tags,
      @required DateTime posted}) {
    return _Gallery(
      id: id,
      token: token,
      title: title,
      titleJpn: titleJpn,
      category: category,
      thumbnail: thumbnail,
      uploader: uploader,
      fileCount: fileCount,
      fileSize: fileSize,
      expunged: expunged,
      rating: rating,
      tags: tags,
      posted: posted,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Gallery = _$GalleryTearOff();

/// @nodoc
mixin _$Gallery {
  int get id;
  String get token;
  String get title;
  String get titleJpn;
  String get category;
  String get thumbnail;
  String get uploader;
  int get fileCount;
  int get fileSize;
  bool get expunged;
  double get rating;
  BuiltList<GalleryTag> get tags;
  DateTime get posted;

  $GalleryCopyWith<Gallery> get copyWith;
}

/// @nodoc
abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String token,
      String title,
      String titleJpn,
      String category,
      String thumbnail,
      String uploader,
      int fileCount,
      int fileSize,
      bool expunged,
      double rating,
      BuiltList<GalleryTag> tags,
      DateTime posted});
}

/// @nodoc
class _$GalleryCopyWithImpl<$Res> implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._value, this._then);

  final Gallery _value;
  // ignore: unused_field
  final $Res Function(Gallery) _then;

  @override
  $Res call({
    Object id = freezed,
    Object token = freezed,
    Object title = freezed,
    Object titleJpn = freezed,
    Object category = freezed,
    Object thumbnail = freezed,
    Object uploader = freezed,
    Object fileCount = freezed,
    Object fileSize = freezed,
    Object expunged = freezed,
    Object rating = freezed,
    Object tags = freezed,
    Object posted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      token: token == freezed ? _value.token : token as String,
      title: title == freezed ? _value.title : title as String,
      titleJpn: titleJpn == freezed ? _value.titleJpn : titleJpn as String,
      category: category == freezed ? _value.category : category as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      uploader: uploader == freezed ? _value.uploader : uploader as String,
      fileCount: fileCount == freezed ? _value.fileCount : fileCount as int,
      fileSize: fileSize == freezed ? _value.fileSize : fileSize as int,
      expunged: expunged == freezed ? _value.expunged : expunged as bool,
      rating: rating == freezed ? _value.rating : rating as double,
      tags: tags == freezed ? _value.tags : tags as BuiltList<GalleryTag>,
      posted: posted == freezed ? _value.posted : posted as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$GalleryCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$GalleryCopyWith(_Gallery value, $Res Function(_Gallery) then) =
      __$GalleryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String token,
      String title,
      String titleJpn,
      String category,
      String thumbnail,
      String uploader,
      int fileCount,
      int fileSize,
      bool expunged,
      double rating,
      BuiltList<GalleryTag> tags,
      DateTime posted});
}

/// @nodoc
class __$GalleryCopyWithImpl<$Res> extends _$GalleryCopyWithImpl<$Res>
    implements _$GalleryCopyWith<$Res> {
  __$GalleryCopyWithImpl(_Gallery _value, $Res Function(_Gallery) _then)
      : super(_value, (v) => _then(v as _Gallery));

  @override
  _Gallery get _value => super._value as _Gallery;

  @override
  $Res call({
    Object id = freezed,
    Object token = freezed,
    Object title = freezed,
    Object titleJpn = freezed,
    Object category = freezed,
    Object thumbnail = freezed,
    Object uploader = freezed,
    Object fileCount = freezed,
    Object fileSize = freezed,
    Object expunged = freezed,
    Object rating = freezed,
    Object tags = freezed,
    Object posted = freezed,
  }) {
    return _then(_Gallery(
      id: id == freezed ? _value.id : id as int,
      token: token == freezed ? _value.token : token as String,
      title: title == freezed ? _value.title : title as String,
      titleJpn: titleJpn == freezed ? _value.titleJpn : titleJpn as String,
      category: category == freezed ? _value.category : category as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      uploader: uploader == freezed ? _value.uploader : uploader as String,
      fileCount: fileCount == freezed ? _value.fileCount : fileCount as int,
      fileSize: fileSize == freezed ? _value.fileSize : fileSize as int,
      expunged: expunged == freezed ? _value.expunged : expunged as bool,
      rating: rating == freezed ? _value.rating : rating as double,
      tags: tags == freezed ? _value.tags : tags as BuiltList<GalleryTag>,
      posted: posted == freezed ? _value.posted : posted as DateTime,
    ));
  }
}

/// @nodoc
class _$_Gallery extends _Gallery {
  const _$_Gallery(
      {@required this.id,
      @required this.token,
      @required this.title,
      @required this.titleJpn,
      @required this.category,
      @required this.thumbnail,
      @required this.uploader,
      @required this.fileCount,
      @required this.fileSize,
      @required this.expunged,
      @required this.rating,
      @required this.tags,
      @required this.posted})
      : assert(id != null),
        assert(token != null),
        assert(title != null),
        assert(titleJpn != null),
        assert(category != null),
        assert(thumbnail != null),
        assert(uploader != null),
        assert(fileCount != null),
        assert(fileSize != null),
        assert(expunged != null),
        assert(rating != null),
        assert(tags != null),
        assert(posted != null),
        super._();

  @override
  final int id;
  @override
  final String token;
  @override
  final String title;
  @override
  final String titleJpn;
  @override
  final String category;
  @override
  final String thumbnail;
  @override
  final String uploader;
  @override
  final int fileCount;
  @override
  final int fileSize;
  @override
  final bool expunged;
  @override
  final double rating;
  @override
  final BuiltList<GalleryTag> tags;
  @override
  final DateTime posted;

  @override
  String toString() {
    return 'Gallery(id: $id, token: $token, title: $title, titleJpn: $titleJpn, category: $category, thumbnail: $thumbnail, uploader: $uploader, fileCount: $fileCount, fileSize: $fileSize, expunged: $expunged, rating: $rating, tags: $tags, posted: $posted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gallery &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.titleJpn, titleJpn) ||
                const DeepCollectionEquality()
                    .equals(other.titleJpn, titleJpn)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)) &&
            (identical(other.uploader, uploader) ||
                const DeepCollectionEquality()
                    .equals(other.uploader, uploader)) &&
            (identical(other.fileCount, fileCount) ||
                const DeepCollectionEquality()
                    .equals(other.fileCount, fileCount)) &&
            (identical(other.fileSize, fileSize) ||
                const DeepCollectionEquality()
                    .equals(other.fileSize, fileSize)) &&
            (identical(other.expunged, expunged) ||
                const DeepCollectionEquality()
                    .equals(other.expunged, expunged)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.posted, posted) ||
                const DeepCollectionEquality().equals(other.posted, posted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(titleJpn) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(thumbnail) ^
      const DeepCollectionEquality().hash(uploader) ^
      const DeepCollectionEquality().hash(fileCount) ^
      const DeepCollectionEquality().hash(fileSize) ^
      const DeepCollectionEquality().hash(expunged) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(posted);

  @override
  _$GalleryCopyWith<_Gallery> get copyWith =>
      __$GalleryCopyWithImpl<_Gallery>(this, _$identity);
}

abstract class _Gallery extends Gallery {
  const _Gallery._() : super._();
  const factory _Gallery(
      {@required int id,
      @required String token,
      @required String title,
      @required String titleJpn,
      @required String category,
      @required String thumbnail,
      @required String uploader,
      @required int fileCount,
      @required int fileSize,
      @required bool expunged,
      @required double rating,
      @required BuiltList<GalleryTag> tags,
      @required DateTime posted}) = _$_Gallery;

  @override
  int get id;
  @override
  String get token;
  @override
  String get title;
  @override
  String get titleJpn;
  @override
  String get category;
  @override
  String get thumbnail;
  @override
  String get uploader;
  @override
  int get fileCount;
  @override
  int get fileSize;
  @override
  bool get expunged;
  @override
  double get rating;
  @override
  BuiltList<GalleryTag> get tags;
  @override
  DateTime get posted;
  @override
  _$GalleryCopyWith<_Gallery> get copyWith;
}

/// @nodoc
class _$GalleryTagTearOff {
  const _$GalleryTagTearOff();

// ignore: unused_element
  _GalleryTag call({String namespace = '', @required String tag}) {
    return _GalleryTag(
      namespace: namespace,
      tag: tag,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GalleryTag = _$GalleryTagTearOff();

/// @nodoc
mixin _$GalleryTag {
  String get namespace;
  String get tag;

  $GalleryTagCopyWith<GalleryTag> get copyWith;
}

/// @nodoc
abstract class $GalleryTagCopyWith<$Res> {
  factory $GalleryTagCopyWith(
          GalleryTag value, $Res Function(GalleryTag) then) =
      _$GalleryTagCopyWithImpl<$Res>;
  $Res call({String namespace, String tag});
}

/// @nodoc
class _$GalleryTagCopyWithImpl<$Res> implements $GalleryTagCopyWith<$Res> {
  _$GalleryTagCopyWithImpl(this._value, this._then);

  final GalleryTag _value;
  // ignore: unused_field
  final $Res Function(GalleryTag) _then;

  @override
  $Res call({
    Object namespace = freezed,
    Object tag = freezed,
  }) {
    return _then(_value.copyWith(
      namespace: namespace == freezed ? _value.namespace : namespace as String,
      tag: tag == freezed ? _value.tag : tag as String,
    ));
  }
}

/// @nodoc
abstract class _$GalleryTagCopyWith<$Res> implements $GalleryTagCopyWith<$Res> {
  factory _$GalleryTagCopyWith(
          _GalleryTag value, $Res Function(_GalleryTag) then) =
      __$GalleryTagCopyWithImpl<$Res>;
  @override
  $Res call({String namespace, String tag});
}

/// @nodoc
class __$GalleryTagCopyWithImpl<$Res> extends _$GalleryTagCopyWithImpl<$Res>
    implements _$GalleryTagCopyWith<$Res> {
  __$GalleryTagCopyWithImpl(
      _GalleryTag _value, $Res Function(_GalleryTag) _then)
      : super(_value, (v) => _then(v as _GalleryTag));

  @override
  _GalleryTag get _value => super._value as _GalleryTag;

  @override
  $Res call({
    Object namespace = freezed,
    Object tag = freezed,
  }) {
    return _then(_GalleryTag(
      namespace: namespace == freezed ? _value.namespace : namespace as String,
      tag: tag == freezed ? _value.tag : tag as String,
    ));
  }
}

/// @nodoc
class _$_GalleryTag extends _GalleryTag {
  const _$_GalleryTag({this.namespace = '', @required this.tag})
      : assert(namespace != null),
        assert(tag != null),
        super._();

  @JsonKey(defaultValue: '')
  @override
  final String namespace;
  @override
  final String tag;

  @override
  String toString() {
    return 'GalleryTag(namespace: $namespace, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryTag &&
            (identical(other.namespace, namespace) ||
                const DeepCollectionEquality()
                    .equals(other.namespace, namespace)) &&
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(namespace) ^
      const DeepCollectionEquality().hash(tag);

  @override
  _$GalleryTagCopyWith<_GalleryTag> get copyWith =>
      __$GalleryTagCopyWithImpl<_GalleryTag>(this, _$identity);
}

abstract class _GalleryTag extends GalleryTag {
  const _GalleryTag._() : super._();
  const factory _GalleryTag({String namespace, @required String tag}) =
      _$_GalleryTag;

  @override
  String get namespace;
  @override
  String get tag;
  @override
  _$GalleryTagCopyWith<_GalleryTag> get copyWith;
}

GalleryResponse _$GalleryResponseFromJson(Map<String, dynamic> json) {
  return _GalleryResponse.fromJson(json);
}

/// @nodoc
class _$GalleryResponseTearOff {
  const _$GalleryResponseTearOff();

// ignore: unused_element
  _GalleryResponse call(
      {@JsonKey(name: 'gid') int id,
      String token,
      String title,
      @JsonKey(name: 'title_jpn') String titleJpn,
      String category,
      @JsonKey(name: 'thumb') String thumbnail,
      String uploader,
      @JsonKey(name: 'filecount', fromJson: int.tryParse) int fileCount,
      @JsonKey(name: 'filesize') int fileSize,
      bool expunged,
      @JsonKey(fromJson: double.tryParse) double rating,
      List<String> tags,
      @JsonKey(fromJson: tryParseSecondsSinceEpoch) DateTime posted}) {
    return _GalleryResponse(
      id: id,
      token: token,
      title: title,
      titleJpn: titleJpn,
      category: category,
      thumbnail: thumbnail,
      uploader: uploader,
      fileCount: fileCount,
      fileSize: fileSize,
      expunged: expunged,
      rating: rating,
      tags: tags,
      posted: posted,
    );
  }

// ignore: unused_element
  GalleryResponse fromJson(Map<String, Object> json) {
    return GalleryResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GalleryResponse = _$GalleryResponseTearOff();

/// @nodoc
mixin _$GalleryResponse {
  @JsonKey(name: 'gid')
  int get id;
  String get token;
  String get title;
  @JsonKey(name: 'title_jpn')
  String get titleJpn;
  String get category;
  @JsonKey(name: 'thumb')
  String get thumbnail;
  String get uploader;
  @JsonKey(name: 'filecount', fromJson: int.tryParse)
  int get fileCount;
  @JsonKey(name: 'filesize')
  int get fileSize;
  bool get expunged;
  @JsonKey(fromJson: double.tryParse)
  double get rating;
  List<String> get tags;
  @JsonKey(fromJson: tryParseSecondsSinceEpoch)
  DateTime get posted;

  Map<String, dynamic> toJson();
  $GalleryResponseCopyWith<GalleryResponse> get copyWith;
}

/// @nodoc
abstract class $GalleryResponseCopyWith<$Res> {
  factory $GalleryResponseCopyWith(
          GalleryResponse value, $Res Function(GalleryResponse) then) =
      _$GalleryResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'gid') int id,
      String token,
      String title,
      @JsonKey(name: 'title_jpn') String titleJpn,
      String category,
      @JsonKey(name: 'thumb') String thumbnail,
      String uploader,
      @JsonKey(name: 'filecount', fromJson: int.tryParse) int fileCount,
      @JsonKey(name: 'filesize') int fileSize,
      bool expunged,
      @JsonKey(fromJson: double.tryParse) double rating,
      List<String> tags,
      @JsonKey(fromJson: tryParseSecondsSinceEpoch) DateTime posted});
}

/// @nodoc
class _$GalleryResponseCopyWithImpl<$Res>
    implements $GalleryResponseCopyWith<$Res> {
  _$GalleryResponseCopyWithImpl(this._value, this._then);

  final GalleryResponse _value;
  // ignore: unused_field
  final $Res Function(GalleryResponse) _then;

  @override
  $Res call({
    Object id = freezed,
    Object token = freezed,
    Object title = freezed,
    Object titleJpn = freezed,
    Object category = freezed,
    Object thumbnail = freezed,
    Object uploader = freezed,
    Object fileCount = freezed,
    Object fileSize = freezed,
    Object expunged = freezed,
    Object rating = freezed,
    Object tags = freezed,
    Object posted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      token: token == freezed ? _value.token : token as String,
      title: title == freezed ? _value.title : title as String,
      titleJpn: titleJpn == freezed ? _value.titleJpn : titleJpn as String,
      category: category == freezed ? _value.category : category as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      uploader: uploader == freezed ? _value.uploader : uploader as String,
      fileCount: fileCount == freezed ? _value.fileCount : fileCount as int,
      fileSize: fileSize == freezed ? _value.fileSize : fileSize as int,
      expunged: expunged == freezed ? _value.expunged : expunged as bool,
      rating: rating == freezed ? _value.rating : rating as double,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      posted: posted == freezed ? _value.posted : posted as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$GalleryResponseCopyWith<$Res>
    implements $GalleryResponseCopyWith<$Res> {
  factory _$GalleryResponseCopyWith(
          _GalleryResponse value, $Res Function(_GalleryResponse) then) =
      __$GalleryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'gid') int id,
      String token,
      String title,
      @JsonKey(name: 'title_jpn') String titleJpn,
      String category,
      @JsonKey(name: 'thumb') String thumbnail,
      String uploader,
      @JsonKey(name: 'filecount', fromJson: int.tryParse) int fileCount,
      @JsonKey(name: 'filesize') int fileSize,
      bool expunged,
      @JsonKey(fromJson: double.tryParse) double rating,
      List<String> tags,
      @JsonKey(fromJson: tryParseSecondsSinceEpoch) DateTime posted});
}

/// @nodoc
class __$GalleryResponseCopyWithImpl<$Res>
    extends _$GalleryResponseCopyWithImpl<$Res>
    implements _$GalleryResponseCopyWith<$Res> {
  __$GalleryResponseCopyWithImpl(
      _GalleryResponse _value, $Res Function(_GalleryResponse) _then)
      : super(_value, (v) => _then(v as _GalleryResponse));

  @override
  _GalleryResponse get _value => super._value as _GalleryResponse;

  @override
  $Res call({
    Object id = freezed,
    Object token = freezed,
    Object title = freezed,
    Object titleJpn = freezed,
    Object category = freezed,
    Object thumbnail = freezed,
    Object uploader = freezed,
    Object fileCount = freezed,
    Object fileSize = freezed,
    Object expunged = freezed,
    Object rating = freezed,
    Object tags = freezed,
    Object posted = freezed,
  }) {
    return _then(_GalleryResponse(
      id: id == freezed ? _value.id : id as int,
      token: token == freezed ? _value.token : token as String,
      title: title == freezed ? _value.title : title as String,
      titleJpn: titleJpn == freezed ? _value.titleJpn : titleJpn as String,
      category: category == freezed ? _value.category : category as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      uploader: uploader == freezed ? _value.uploader : uploader as String,
      fileCount: fileCount == freezed ? _value.fileCount : fileCount as int,
      fileSize: fileSize == freezed ? _value.fileSize : fileSize as int,
      expunged: expunged == freezed ? _value.expunged : expunged as bool,
      rating: rating == freezed ? _value.rating : rating as double,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      posted: posted == freezed ? _value.posted : posted as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GalleryResponse implements _GalleryResponse {
  const _$_GalleryResponse(
      {@JsonKey(name: 'gid') this.id,
      this.token,
      this.title,
      @JsonKey(name: 'title_jpn') this.titleJpn,
      this.category,
      @JsonKey(name: 'thumb') this.thumbnail,
      this.uploader,
      @JsonKey(name: 'filecount', fromJson: int.tryParse) this.fileCount,
      @JsonKey(name: 'filesize') this.fileSize,
      this.expunged,
      @JsonKey(fromJson: double.tryParse) this.rating,
      this.tags,
      @JsonKey(fromJson: tryParseSecondsSinceEpoch) this.posted});

  factory _$_GalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GalleryResponseFromJson(json);

  @override
  @JsonKey(name: 'gid')
  final int id;
  @override
  final String token;
  @override
  final String title;
  @override
  @JsonKey(name: 'title_jpn')
  final String titleJpn;
  @override
  final String category;
  @override
  @JsonKey(name: 'thumb')
  final String thumbnail;
  @override
  final String uploader;
  @override
  @JsonKey(name: 'filecount', fromJson: int.tryParse)
  final int fileCount;
  @override
  @JsonKey(name: 'filesize')
  final int fileSize;
  @override
  final bool expunged;
  @override
  @JsonKey(fromJson: double.tryParse)
  final double rating;
  @override
  final List<String> tags;
  @override
  @JsonKey(fromJson: tryParseSecondsSinceEpoch)
  final DateTime posted;

  @override
  String toString() {
    return 'GalleryResponse(id: $id, token: $token, title: $title, titleJpn: $titleJpn, category: $category, thumbnail: $thumbnail, uploader: $uploader, fileCount: $fileCount, fileSize: $fileSize, expunged: $expunged, rating: $rating, tags: $tags, posted: $posted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.titleJpn, titleJpn) ||
                const DeepCollectionEquality()
                    .equals(other.titleJpn, titleJpn)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)) &&
            (identical(other.uploader, uploader) ||
                const DeepCollectionEquality()
                    .equals(other.uploader, uploader)) &&
            (identical(other.fileCount, fileCount) ||
                const DeepCollectionEquality()
                    .equals(other.fileCount, fileCount)) &&
            (identical(other.fileSize, fileSize) ||
                const DeepCollectionEquality()
                    .equals(other.fileSize, fileSize)) &&
            (identical(other.expunged, expunged) ||
                const DeepCollectionEquality()
                    .equals(other.expunged, expunged)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.posted, posted) ||
                const DeepCollectionEquality().equals(other.posted, posted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(titleJpn) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(thumbnail) ^
      const DeepCollectionEquality().hash(uploader) ^
      const DeepCollectionEquality().hash(fileCount) ^
      const DeepCollectionEquality().hash(fileSize) ^
      const DeepCollectionEquality().hash(expunged) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(posted);

  @override
  _$GalleryResponseCopyWith<_GalleryResponse> get copyWith =>
      __$GalleryResponseCopyWithImpl<_GalleryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GalleryResponseToJson(this);
  }
}

abstract class _GalleryResponse implements GalleryResponse {
  const factory _GalleryResponse(
          {@JsonKey(name: 'gid') int id,
          String token,
          String title,
          @JsonKey(name: 'title_jpn') String titleJpn,
          String category,
          @JsonKey(name: 'thumb') String thumbnail,
          String uploader,
          @JsonKey(name: 'filecount', fromJson: int.tryParse) int fileCount,
          @JsonKey(name: 'filesize') int fileSize,
          bool expunged,
          @JsonKey(fromJson: double.tryParse) double rating,
          List<String> tags,
          @JsonKey(fromJson: tryParseSecondsSinceEpoch) DateTime posted}) =
      _$_GalleryResponse;

  factory _GalleryResponse.fromJson(Map<String, dynamic> json) =
      _$_GalleryResponse.fromJson;

  @override
  @JsonKey(name: 'gid')
  int get id;
  @override
  String get token;
  @override
  String get title;
  @override
  @JsonKey(name: 'title_jpn')
  String get titleJpn;
  @override
  String get category;
  @override
  @JsonKey(name: 'thumb')
  String get thumbnail;
  @override
  String get uploader;
  @override
  @JsonKey(name: 'filecount', fromJson: int.tryParse)
  int get fileCount;
  @override
  @JsonKey(name: 'filesize')
  int get fileSize;
  @override
  bool get expunged;
  @override
  @JsonKey(fromJson: double.tryParse)
  double get rating;
  @override
  List<String> get tags;
  @override
  @JsonKey(fromJson: tryParseSecondsSinceEpoch)
  DateTime get posted;
  @override
  _$GalleryResponseCopyWith<_GalleryResponse> get copyWith;
}

/// @nodoc
class _$GalleryReadPositionTearOff {
  const _$GalleryReadPositionTearOff();

// ignore: unused_element
  _GalleryReadPosition call({@required int page, @required DateTime time}) {
    return _GalleryReadPosition(
      page: page,
      time: time,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GalleryReadPosition = _$GalleryReadPositionTearOff();

/// @nodoc
mixin _$GalleryReadPosition {
  int get page;
  DateTime get time;

  $GalleryReadPositionCopyWith<GalleryReadPosition> get copyWith;
}

/// @nodoc
abstract class $GalleryReadPositionCopyWith<$Res> {
  factory $GalleryReadPositionCopyWith(
          GalleryReadPosition value, $Res Function(GalleryReadPosition) then) =
      _$GalleryReadPositionCopyWithImpl<$Res>;
  $Res call({int page, DateTime time});
}

/// @nodoc
class _$GalleryReadPositionCopyWithImpl<$Res>
    implements $GalleryReadPositionCopyWith<$Res> {
  _$GalleryReadPositionCopyWithImpl(this._value, this._then);

  final GalleryReadPosition _value;
  // ignore: unused_field
  final $Res Function(GalleryReadPosition) _then;

  @override
  $Res call({
    Object page = freezed,
    Object time = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
      time: time == freezed ? _value.time : time as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$GalleryReadPositionCopyWith<$Res>
    implements $GalleryReadPositionCopyWith<$Res> {
  factory _$GalleryReadPositionCopyWith(_GalleryReadPosition value,
          $Res Function(_GalleryReadPosition) then) =
      __$GalleryReadPositionCopyWithImpl<$Res>;
  @override
  $Res call({int page, DateTime time});
}

/// @nodoc
class __$GalleryReadPositionCopyWithImpl<$Res>
    extends _$GalleryReadPositionCopyWithImpl<$Res>
    implements _$GalleryReadPositionCopyWith<$Res> {
  __$GalleryReadPositionCopyWithImpl(
      _GalleryReadPosition _value, $Res Function(_GalleryReadPosition) _then)
      : super(_value, (v) => _then(v as _GalleryReadPosition));

  @override
  _GalleryReadPosition get _value => super._value as _GalleryReadPosition;

  @override
  $Res call({
    Object page = freezed,
    Object time = freezed,
  }) {
    return _then(_GalleryReadPosition(
      page: page == freezed ? _value.page : page as int,
      time: time == freezed ? _value.time : time as DateTime,
    ));
  }
}

/// @nodoc
class _$_GalleryReadPosition implements _GalleryReadPosition {
  const _$_GalleryReadPosition({@required this.page, @required this.time})
      : assert(page != null),
        assert(time != null);

  @override
  final int page;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'GalleryReadPosition(page: $page, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryReadPosition &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(time);

  @override
  _$GalleryReadPositionCopyWith<_GalleryReadPosition> get copyWith =>
      __$GalleryReadPositionCopyWithImpl<_GalleryReadPosition>(
          this, _$identity);
}

abstract class _GalleryReadPosition implements GalleryReadPosition {
  const factory _GalleryReadPosition(
      {@required int page, @required DateTime time}) = _$_GalleryReadPosition;

  @override
  int get page;
  @override
  DateTime get time;
  @override
  _$GalleryReadPositionCopyWith<_GalleryReadPosition> get copyWith;
}
