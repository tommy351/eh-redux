// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'gallery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GalleryTearOff {
  const _$GalleryTearOff();

  _Gallery call(
      {@required GalleryId id,
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

// ignore: unused_element
const $Gallery = _$GalleryTearOff();

mixin _$Gallery {
  GalleryId get id;
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

abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res>;
  $Res call(
      {GalleryId id,
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

  $GalleryIdCopyWith<$Res> get id;
}

class _$GalleryCopyWithImpl<$Res> implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._value, this._then);

  final Gallery _value;
  // ignore: unused_field
  final $Res Function(Gallery) _then;

  @override
  $Res call({
    Object id = freezed,
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
      id: id == freezed ? _value.id : id as GalleryId,
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

  @override
  $GalleryIdCopyWith<$Res> get id {
    if (_value.id == null) {
      return null;
    }
    return $GalleryIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

abstract class _$GalleryCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$GalleryCopyWith(_Gallery value, $Res Function(_Gallery) then) =
      __$GalleryCopyWithImpl<$Res>;
  @override
  $Res call(
      {GalleryId id,
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

  @override
  $GalleryIdCopyWith<$Res> get id;
}

class __$GalleryCopyWithImpl<$Res> extends _$GalleryCopyWithImpl<$Res>
    implements _$GalleryCopyWith<$Res> {
  __$GalleryCopyWithImpl(_Gallery _value, $Res Function(_Gallery) _then)
      : super(_value, (v) => _then(v as _Gallery));

  @override
  _Gallery get _value => super._value as _Gallery;

  @override
  $Res call({
    Object id = freezed,
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
      id: id == freezed ? _value.id : id as GalleryId,
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

class _$_Gallery implements _Gallery {
  const _$_Gallery(
      {@required this.id,
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
        assert(posted != null);

  @override
  final GalleryId id;
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
    return 'Gallery(id: $id, title: $title, titleJpn: $titleJpn, category: $category, thumbnail: $thumbnail, uploader: $uploader, fileCount: $fileCount, fileSize: $fileSize, expunged: $expunged, rating: $rating, tags: $tags, posted: $posted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gallery &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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

abstract class _Gallery implements Gallery {
  const factory _Gallery(
      {@required GalleryId id,
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
  GalleryId get id;
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

GalleryResponse _$GalleryResponseFromJson(Map<String, dynamic> json) {
  return _GalleryResponse.fromJson(json);
}

class _$GalleryResponseTearOff {
  const _$GalleryResponseTearOff();

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
}

// ignore: unused_element
const $GalleryResponse = _$GalleryResponseTearOff();

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

class _$GalleryIdTearOff {
  const _$GalleryIdTearOff();

  _GalleryId call({@required int id, @required String token}) {
    return _GalleryId(
      id: id,
      token: token,
    );
  }
}

// ignore: unused_element
const $GalleryId = _$GalleryIdTearOff();

mixin _$GalleryId {
  int get id;
  String get token;

  $GalleryIdCopyWith<GalleryId> get copyWith;
}

abstract class $GalleryIdCopyWith<$Res> {
  factory $GalleryIdCopyWith(GalleryId value, $Res Function(GalleryId) then) =
      _$GalleryIdCopyWithImpl<$Res>;
  $Res call({int id, String token});
}

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

abstract class _$GalleryIdCopyWith<$Res> implements $GalleryIdCopyWith<$Res> {
  factory _$GalleryIdCopyWith(
          _GalleryId value, $Res Function(_GalleryId) then) =
      __$GalleryIdCopyWithImpl<$Res>;
  @override
  $Res call({int id, String token});
}

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

class _$_GalleryId implements _GalleryId {
  const _$_GalleryId({@required this.id, @required this.token})
      : assert(id != null),
        assert(token != null);

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

abstract class _GalleryId implements GalleryId {
  const factory _GalleryId({@required int id, @required String token}) =
      _$_GalleryId;

  @override
  int get id;
  @override
  String get token;
  @override
  _$GalleryIdCopyWith<_GalleryId> get copyWith;
}

class _$GalleryTagTearOff {
  const _$GalleryTagTearOff();

  _GalleryTag call({String namespace = '', @required String tag}) {
    return _GalleryTag(
      namespace: namespace,
      tag: tag,
    );
  }
}

// ignore: unused_element
const $GalleryTag = _$GalleryTagTearOff();

mixin _$GalleryTag {
  String get namespace;
  String get tag;

  $GalleryTagCopyWith<GalleryTag> get copyWith;
}

abstract class $GalleryTagCopyWith<$Res> {
  factory $GalleryTagCopyWith(
          GalleryTag value, $Res Function(GalleryTag) then) =
      _$GalleryTagCopyWithImpl<$Res>;
  $Res call({String namespace, String tag});
}

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

abstract class _$GalleryTagCopyWith<$Res> implements $GalleryTagCopyWith<$Res> {
  factory _$GalleryTagCopyWith(
          _GalleryTag value, $Res Function(_GalleryTag) then) =
      __$GalleryTagCopyWithImpl<$Res>;
  @override
  $Res call({String namespace, String tag});
}

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

class _$GalleryPaginationKeyTearOff {
  const _$GalleryPaginationKeyTearOff();

  GalleryPaginationKeyFrontPage frontPage() {
    return const GalleryPaginationKeyFrontPage();
  }

  GalleryPaginationKeyFavorite favorite() {
    return const GalleryPaginationKeyFavorite();
  }

  GalleryPaginationKeySearch search(
      {@required String query,
      int categoryFilter = 0,
      @required BuiltMap<String, bool> advancedOptions,
      int minimumRating = 0}) {
    return GalleryPaginationKeySearch(
      query: query,
      categoryFilter: categoryFilter,
      advancedOptions: advancedOptions,
      minimumRating: minimumRating,
    );
  }
}

// ignore: unused_element
const $GalleryPaginationKey = _$GalleryPaginationKeyTearOff();

mixin _$GalleryPaginationKey {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result frontPage(),
    @required Result favorite(),
    @required
        Result search(String query, int categoryFilter,
            BuiltMap<String, bool> advancedOptions, int minimumRating),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result frontPage(),
    Result favorite(),
    Result search(String query, int categoryFilter,
        BuiltMap<String, bool> advancedOptions, int minimumRating),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result frontPage(GalleryPaginationKeyFrontPage value),
    @required Result favorite(GalleryPaginationKeyFavorite value),
    @required Result search(GalleryPaginationKeySearch value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result frontPage(GalleryPaginationKeyFrontPage value),
    Result favorite(GalleryPaginationKeyFavorite value),
    Result search(GalleryPaginationKeySearch value),
    @required Result orElse(),
  });
}

abstract class $GalleryPaginationKeyCopyWith<$Res> {
  factory $GalleryPaginationKeyCopyWith(GalleryPaginationKey value,
          $Res Function(GalleryPaginationKey) then) =
      _$GalleryPaginationKeyCopyWithImpl<$Res>;
}

class _$GalleryPaginationKeyCopyWithImpl<$Res>
    implements $GalleryPaginationKeyCopyWith<$Res> {
  _$GalleryPaginationKeyCopyWithImpl(this._value, this._then);

  final GalleryPaginationKey _value;
  // ignore: unused_field
  final $Res Function(GalleryPaginationKey) _then;
}

abstract class $GalleryPaginationKeyFrontPageCopyWith<$Res> {
  factory $GalleryPaginationKeyFrontPageCopyWith(
          GalleryPaginationKeyFrontPage value,
          $Res Function(GalleryPaginationKeyFrontPage) then) =
      _$GalleryPaginationKeyFrontPageCopyWithImpl<$Res>;
}

class _$GalleryPaginationKeyFrontPageCopyWithImpl<$Res>
    extends _$GalleryPaginationKeyCopyWithImpl<$Res>
    implements $GalleryPaginationKeyFrontPageCopyWith<$Res> {
  _$GalleryPaginationKeyFrontPageCopyWithImpl(
      GalleryPaginationKeyFrontPage _value,
      $Res Function(GalleryPaginationKeyFrontPage) _then)
      : super(_value, (v) => _then(v as GalleryPaginationKeyFrontPage));

  @override
  GalleryPaginationKeyFrontPage get _value =>
      super._value as GalleryPaginationKeyFrontPage;
}

class _$GalleryPaginationKeyFrontPage implements GalleryPaginationKeyFrontPage {
  const _$GalleryPaginationKeyFrontPage();

  @override
  String toString() {
    return 'GalleryPaginationKey.frontPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GalleryPaginationKeyFrontPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result frontPage(),
    @required Result favorite(),
    @required
        Result search(String query, int categoryFilter,
            BuiltMap<String, bool> advancedOptions, int minimumRating),
  }) {
    assert(frontPage != null);
    assert(favorite != null);
    assert(search != null);
    return frontPage();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result frontPage(),
    Result favorite(),
    Result search(String query, int categoryFilter,
        BuiltMap<String, bool> advancedOptions, int minimumRating),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (frontPage != null) {
      return frontPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result frontPage(GalleryPaginationKeyFrontPage value),
    @required Result favorite(GalleryPaginationKeyFavorite value),
    @required Result search(GalleryPaginationKeySearch value),
  }) {
    assert(frontPage != null);
    assert(favorite != null);
    assert(search != null);
    return frontPage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result frontPage(GalleryPaginationKeyFrontPage value),
    Result favorite(GalleryPaginationKeyFavorite value),
    Result search(GalleryPaginationKeySearch value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (frontPage != null) {
      return frontPage(this);
    }
    return orElse();
  }
}

abstract class GalleryPaginationKeyFrontPage implements GalleryPaginationKey {
  const factory GalleryPaginationKeyFrontPage() =
      _$GalleryPaginationKeyFrontPage;
}

abstract class $GalleryPaginationKeyFavoriteCopyWith<$Res> {
  factory $GalleryPaginationKeyFavoriteCopyWith(
          GalleryPaginationKeyFavorite value,
          $Res Function(GalleryPaginationKeyFavorite) then) =
      _$GalleryPaginationKeyFavoriteCopyWithImpl<$Res>;
}

class _$GalleryPaginationKeyFavoriteCopyWithImpl<$Res>
    extends _$GalleryPaginationKeyCopyWithImpl<$Res>
    implements $GalleryPaginationKeyFavoriteCopyWith<$Res> {
  _$GalleryPaginationKeyFavoriteCopyWithImpl(
      GalleryPaginationKeyFavorite _value,
      $Res Function(GalleryPaginationKeyFavorite) _then)
      : super(_value, (v) => _then(v as GalleryPaginationKeyFavorite));

  @override
  GalleryPaginationKeyFavorite get _value =>
      super._value as GalleryPaginationKeyFavorite;
}

class _$GalleryPaginationKeyFavorite implements GalleryPaginationKeyFavorite {
  const _$GalleryPaginationKeyFavorite();

  @override
  String toString() {
    return 'GalleryPaginationKey.favorite()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GalleryPaginationKeyFavorite);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result frontPage(),
    @required Result favorite(),
    @required
        Result search(String query, int categoryFilter,
            BuiltMap<String, bool> advancedOptions, int minimumRating),
  }) {
    assert(frontPage != null);
    assert(favorite != null);
    assert(search != null);
    return favorite();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result frontPage(),
    Result favorite(),
    Result search(String query, int categoryFilter,
        BuiltMap<String, bool> advancedOptions, int minimumRating),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (favorite != null) {
      return favorite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result frontPage(GalleryPaginationKeyFrontPage value),
    @required Result favorite(GalleryPaginationKeyFavorite value),
    @required Result search(GalleryPaginationKeySearch value),
  }) {
    assert(frontPage != null);
    assert(favorite != null);
    assert(search != null);
    return favorite(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result frontPage(GalleryPaginationKeyFrontPage value),
    Result favorite(GalleryPaginationKeyFavorite value),
    Result search(GalleryPaginationKeySearch value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (favorite != null) {
      return favorite(this);
    }
    return orElse();
  }
}

abstract class GalleryPaginationKeyFavorite implements GalleryPaginationKey {
  const factory GalleryPaginationKeyFavorite() = _$GalleryPaginationKeyFavorite;
}

abstract class $GalleryPaginationKeySearchCopyWith<$Res> {
  factory $GalleryPaginationKeySearchCopyWith(GalleryPaginationKeySearch value,
          $Res Function(GalleryPaginationKeySearch) then) =
      _$GalleryPaginationKeySearchCopyWithImpl<$Res>;
  $Res call(
      {String query,
      int categoryFilter,
      BuiltMap<String, bool> advancedOptions,
      int minimumRating});
}

class _$GalleryPaginationKeySearchCopyWithImpl<$Res>
    extends _$GalleryPaginationKeyCopyWithImpl<$Res>
    implements $GalleryPaginationKeySearchCopyWith<$Res> {
  _$GalleryPaginationKeySearchCopyWithImpl(GalleryPaginationKeySearch _value,
      $Res Function(GalleryPaginationKeySearch) _then)
      : super(_value, (v) => _then(v as GalleryPaginationKeySearch));

  @override
  GalleryPaginationKeySearch get _value =>
      super._value as GalleryPaginationKeySearch;

  @override
  $Res call({
    Object query = freezed,
    Object categoryFilter = freezed,
    Object advancedOptions = freezed,
    Object minimumRating = freezed,
  }) {
    return _then(GalleryPaginationKeySearch(
      query: query == freezed ? _value.query : query as String,
      categoryFilter: categoryFilter == freezed
          ? _value.categoryFilter
          : categoryFilter as int,
      advancedOptions: advancedOptions == freezed
          ? _value.advancedOptions
          : advancedOptions as BuiltMap<String, bool>,
      minimumRating: minimumRating == freezed
          ? _value.minimumRating
          : minimumRating as int,
    ));
  }
}

class _$GalleryPaginationKeySearch implements GalleryPaginationKeySearch {
  const _$GalleryPaginationKeySearch(
      {@required this.query,
      this.categoryFilter = 0,
      @required this.advancedOptions,
      this.minimumRating = 0})
      : assert(query != null),
        assert(categoryFilter != null),
        assert(advancedOptions != null),
        assert(minimumRating != null);

  @override
  final String query;
  @JsonKey(defaultValue: 0)
  @override
  final int categoryFilter;
  @override
  final BuiltMap<String, bool> advancedOptions;
  @JsonKey(defaultValue: 0)
  @override
  final int minimumRating;

  @override
  String toString() {
    return 'GalleryPaginationKey.search(query: $query, categoryFilter: $categoryFilter, advancedOptions: $advancedOptions, minimumRating: $minimumRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryPaginationKeySearch &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.categoryFilter, categoryFilter) ||
                const DeepCollectionEquality()
                    .equals(other.categoryFilter, categoryFilter)) &&
            (identical(other.advancedOptions, advancedOptions) ||
                const DeepCollectionEquality()
                    .equals(other.advancedOptions, advancedOptions)) &&
            (identical(other.minimumRating, minimumRating) ||
                const DeepCollectionEquality()
                    .equals(other.minimumRating, minimumRating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(categoryFilter) ^
      const DeepCollectionEquality().hash(advancedOptions) ^
      const DeepCollectionEquality().hash(minimumRating);

  @override
  $GalleryPaginationKeySearchCopyWith<GalleryPaginationKeySearch>
      get copyWith =>
          _$GalleryPaginationKeySearchCopyWithImpl<GalleryPaginationKeySearch>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result frontPage(),
    @required Result favorite(),
    @required
        Result search(String query, int categoryFilter,
            BuiltMap<String, bool> advancedOptions, int minimumRating),
  }) {
    assert(frontPage != null);
    assert(favorite != null);
    assert(search != null);
    return search(query, categoryFilter, advancedOptions, minimumRating);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result frontPage(),
    Result favorite(),
    Result search(String query, int categoryFilter,
        BuiltMap<String, bool> advancedOptions, int minimumRating),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (search != null) {
      return search(query, categoryFilter, advancedOptions, minimumRating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result frontPage(GalleryPaginationKeyFrontPage value),
    @required Result favorite(GalleryPaginationKeyFavorite value),
    @required Result search(GalleryPaginationKeySearch value),
  }) {
    assert(frontPage != null);
    assert(favorite != null);
    assert(search != null);
    return search(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result frontPage(GalleryPaginationKeyFrontPage value),
    Result favorite(GalleryPaginationKeyFavorite value),
    Result search(GalleryPaginationKeySearch value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class GalleryPaginationKeySearch implements GalleryPaginationKey {
  const factory GalleryPaginationKeySearch(
      {@required String query,
      int categoryFilter,
      @required BuiltMap<String, bool> advancedOptions,
      int minimumRating}) = _$GalleryPaginationKeySearch;

  String get query;
  int get categoryFilter;
  BuiltMap<String, bool> get advancedOptions;
  int get minimumRating;
  $GalleryPaginationKeySearchCopyWith<GalleryPaginationKeySearch> get copyWith;
}

class _$GalleryIdWithPageTearOff {
  const _$GalleryIdWithPageTearOff();

  _GalleryIdWithPage call({@required GalleryId galleryId, @required int page}) {
    return _GalleryIdWithPage(
      galleryId: galleryId,
      page: page,
    );
  }
}

// ignore: unused_element
const $GalleryIdWithPage = _$GalleryIdWithPageTearOff();

mixin _$GalleryIdWithPage {
  GalleryId get galleryId;
  int get page;

  $GalleryIdWithPageCopyWith<GalleryIdWithPage> get copyWith;
}

abstract class $GalleryIdWithPageCopyWith<$Res> {
  factory $GalleryIdWithPageCopyWith(
          GalleryIdWithPage value, $Res Function(GalleryIdWithPage) then) =
      _$GalleryIdWithPageCopyWithImpl<$Res>;
  $Res call({GalleryId galleryId, int page});

  $GalleryIdCopyWith<$Res> get galleryId;
}

class _$GalleryIdWithPageCopyWithImpl<$Res>
    implements $GalleryIdWithPageCopyWith<$Res> {
  _$GalleryIdWithPageCopyWithImpl(this._value, this._then);

  final GalleryIdWithPage _value;
  // ignore: unused_field
  final $Res Function(GalleryIdWithPage) _then;

  @override
  $Res call({
    Object galleryId = freezed,
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId:
          galleryId == freezed ? _value.galleryId : galleryId as GalleryId,
      page: page == freezed ? _value.page : page as int,
    ));
  }

  @override
  $GalleryIdCopyWith<$Res> get galleryId {
    if (_value.galleryId == null) {
      return null;
    }
    return $GalleryIdCopyWith<$Res>(_value.galleryId, (value) {
      return _then(_value.copyWith(galleryId: value));
    });
  }
}

abstract class _$GalleryIdWithPageCopyWith<$Res>
    implements $GalleryIdWithPageCopyWith<$Res> {
  factory _$GalleryIdWithPageCopyWith(
          _GalleryIdWithPage value, $Res Function(_GalleryIdWithPage) then) =
      __$GalleryIdWithPageCopyWithImpl<$Res>;
  @override
  $Res call({GalleryId galleryId, int page});

  @override
  $GalleryIdCopyWith<$Res> get galleryId;
}

class __$GalleryIdWithPageCopyWithImpl<$Res>
    extends _$GalleryIdWithPageCopyWithImpl<$Res>
    implements _$GalleryIdWithPageCopyWith<$Res> {
  __$GalleryIdWithPageCopyWithImpl(
      _GalleryIdWithPage _value, $Res Function(_GalleryIdWithPage) _then)
      : super(_value, (v) => _then(v as _GalleryIdWithPage));

  @override
  _GalleryIdWithPage get _value => super._value as _GalleryIdWithPage;

  @override
  $Res call({
    Object galleryId = freezed,
    Object page = freezed,
  }) {
    return _then(_GalleryIdWithPage(
      galleryId:
          galleryId == freezed ? _value.galleryId : galleryId as GalleryId,
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

class _$_GalleryIdWithPage implements _GalleryIdWithPage {
  const _$_GalleryIdWithPage({@required this.galleryId, @required this.page})
      : assert(galleryId != null),
        assert(page != null);

  @override
  final GalleryId galleryId;
  @override
  final int page;

  @override
  String toString() {
    return 'GalleryIdWithPage(galleryId: $galleryId, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryIdWithPage &&
            (identical(other.galleryId, galleryId) ||
                const DeepCollectionEquality()
                    .equals(other.galleryId, galleryId)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(galleryId) ^
      const DeepCollectionEquality().hash(page);

  @override
  _$GalleryIdWithPageCopyWith<_GalleryIdWithPage> get copyWith =>
      __$GalleryIdWithPageCopyWithImpl<_GalleryIdWithPage>(this, _$identity);
}

abstract class _GalleryIdWithPage implements GalleryIdWithPage {
  const factory _GalleryIdWithPage(
      {@required GalleryId galleryId,
      @required int page}) = _$_GalleryIdWithPage;

  @override
  GalleryId get galleryId;
  @override
  int get page;
  @override
  _$GalleryIdWithPageCopyWith<_GalleryIdWithPage> get copyWith;
}

class _$GalleryDetailsTearOff {
  const _$GalleryDetailsTearOff();

  _GalleryDetails call(
      {@required int favoritesCount,
      @required int ratingCount,
      @required int currentFavorite}) {
    return _GalleryDetails(
      favoritesCount: favoritesCount,
      ratingCount: ratingCount,
      currentFavorite: currentFavorite,
    );
  }
}

// ignore: unused_element
const $GalleryDetails = _$GalleryDetailsTearOff();

mixin _$GalleryDetails {
  int get favoritesCount;
  int get ratingCount;
  int get currentFavorite;

  $GalleryDetailsCopyWith<GalleryDetails> get copyWith;
}

abstract class $GalleryDetailsCopyWith<$Res> {
  factory $GalleryDetailsCopyWith(
          GalleryDetails value, $Res Function(GalleryDetails) then) =
      _$GalleryDetailsCopyWithImpl<$Res>;
  $Res call({int favoritesCount, int ratingCount, int currentFavorite});
}

class _$GalleryDetailsCopyWithImpl<$Res>
    implements $GalleryDetailsCopyWith<$Res> {
  _$GalleryDetailsCopyWithImpl(this._value, this._then);

  final GalleryDetails _value;
  // ignore: unused_field
  final $Res Function(GalleryDetails) _then;

  @override
  $Res call({
    Object favoritesCount = freezed,
    Object ratingCount = freezed,
    Object currentFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      favoritesCount: favoritesCount == freezed
          ? _value.favoritesCount
          : favoritesCount as int,
      ratingCount:
          ratingCount == freezed ? _value.ratingCount : ratingCount as int,
      currentFavorite: currentFavorite == freezed
          ? _value.currentFavorite
          : currentFavorite as int,
    ));
  }
}

abstract class _$GalleryDetailsCopyWith<$Res>
    implements $GalleryDetailsCopyWith<$Res> {
  factory _$GalleryDetailsCopyWith(
          _GalleryDetails value, $Res Function(_GalleryDetails) then) =
      __$GalleryDetailsCopyWithImpl<$Res>;
  @override
  $Res call({int favoritesCount, int ratingCount, int currentFavorite});
}

class __$GalleryDetailsCopyWithImpl<$Res>
    extends _$GalleryDetailsCopyWithImpl<$Res>
    implements _$GalleryDetailsCopyWith<$Res> {
  __$GalleryDetailsCopyWithImpl(
      _GalleryDetails _value, $Res Function(_GalleryDetails) _then)
      : super(_value, (v) => _then(v as _GalleryDetails));

  @override
  _GalleryDetails get _value => super._value as _GalleryDetails;

  @override
  $Res call({
    Object favoritesCount = freezed,
    Object ratingCount = freezed,
    Object currentFavorite = freezed,
  }) {
    return _then(_GalleryDetails(
      favoritesCount: favoritesCount == freezed
          ? _value.favoritesCount
          : favoritesCount as int,
      ratingCount:
          ratingCount == freezed ? _value.ratingCount : ratingCount as int,
      currentFavorite: currentFavorite == freezed
          ? _value.currentFavorite
          : currentFavorite as int,
    ));
  }
}

class _$_GalleryDetails implements _GalleryDetails {
  const _$_GalleryDetails(
      {@required this.favoritesCount,
      @required this.ratingCount,
      @required this.currentFavorite})
      : assert(favoritesCount != null),
        assert(ratingCount != null),
        assert(currentFavorite != null);

  @override
  final int favoritesCount;
  @override
  final int ratingCount;
  @override
  final int currentFavorite;

  @override
  String toString() {
    return 'GalleryDetails(favoritesCount: $favoritesCount, ratingCount: $ratingCount, currentFavorite: $currentFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryDetails &&
            (identical(other.favoritesCount, favoritesCount) ||
                const DeepCollectionEquality()
                    .equals(other.favoritesCount, favoritesCount)) &&
            (identical(other.ratingCount, ratingCount) ||
                const DeepCollectionEquality()
                    .equals(other.ratingCount, ratingCount)) &&
            (identical(other.currentFavorite, currentFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.currentFavorite, currentFavorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favoritesCount) ^
      const DeepCollectionEquality().hash(ratingCount) ^
      const DeepCollectionEquality().hash(currentFavorite);

  @override
  _$GalleryDetailsCopyWith<_GalleryDetails> get copyWith =>
      __$GalleryDetailsCopyWithImpl<_GalleryDetails>(this, _$identity);
}

abstract class _GalleryDetails implements GalleryDetails {
  const factory _GalleryDetails(
      {@required int favoritesCount,
      @required int ratingCount,
      @required int currentFavorite}) = _$_GalleryDetails;

  @override
  int get favoritesCount;
  @override
  int get ratingCount;
  @override
  int get currentFavorite;
  @override
  _$GalleryDetailsCopyWith<_GalleryDetails> get copyWith;
}

class _$GalleryErrorTearOff {
  const _$GalleryErrorTearOff();

  _GalleryError call({@required String message}) {
    return _GalleryError(
      message: message,
    );
  }

  GalleryErrorContentWarning contentWarning({@required String reason}) {
    return GalleryErrorContentWarning(
      reason: reason,
    );
  }
}

// ignore: unused_element
const $GalleryError = _$GalleryErrorTearOff();

mixin _$GalleryError {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    @required Result orElse(),
  });
}

abstract class $GalleryErrorCopyWith<$Res> {
  factory $GalleryErrorCopyWith(
          GalleryError value, $Res Function(GalleryError) then) =
      _$GalleryErrorCopyWithImpl<$Res>;
}

class _$GalleryErrorCopyWithImpl<$Res> implements $GalleryErrorCopyWith<$Res> {
  _$GalleryErrorCopyWithImpl(this._value, this._then);

  final GalleryError _value;
  // ignore: unused_field
  final $Res Function(GalleryError) _then;
}

abstract class _$GalleryErrorCopyWith<$Res> {
  factory _$GalleryErrorCopyWith(
          _GalleryError value, $Res Function(_GalleryError) then) =
      __$GalleryErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$GalleryErrorCopyWithImpl<$Res> extends _$GalleryErrorCopyWithImpl<$Res>
    implements _$GalleryErrorCopyWith<$Res> {
  __$GalleryErrorCopyWithImpl(
      _GalleryError _value, $Res Function(_GalleryError) _then)
      : super(_value, (v) => _then(v as _GalleryError));

  @override
  _GalleryError get _value => super._value as _GalleryError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_GalleryError(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_GalleryError implements _GalleryError {
  const _$_GalleryError({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'GalleryError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$GalleryErrorCopyWith<_GalleryError> get copyWith =>
      __$GalleryErrorCopyWithImpl<_GalleryError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    return $default(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _GalleryError implements GalleryError {
  const factory _GalleryError({@required String message}) = _$_GalleryError;

  String get message;
  _$GalleryErrorCopyWith<_GalleryError> get copyWith;
}

abstract class $GalleryErrorContentWarningCopyWith<$Res> {
  factory $GalleryErrorContentWarningCopyWith(GalleryErrorContentWarning value,
          $Res Function(GalleryErrorContentWarning) then) =
      _$GalleryErrorContentWarningCopyWithImpl<$Res>;
  $Res call({String reason});
}

class _$GalleryErrorContentWarningCopyWithImpl<$Res>
    extends _$GalleryErrorCopyWithImpl<$Res>
    implements $GalleryErrorContentWarningCopyWith<$Res> {
  _$GalleryErrorContentWarningCopyWithImpl(GalleryErrorContentWarning _value,
      $Res Function(GalleryErrorContentWarning) _then)
      : super(_value, (v) => _then(v as GalleryErrorContentWarning));

  @override
  GalleryErrorContentWarning get _value =>
      super._value as GalleryErrorContentWarning;

  @override
  $Res call({
    Object reason = freezed,
  }) {
    return _then(GalleryErrorContentWarning(
      reason: reason == freezed ? _value.reason : reason as String,
    ));
  }
}

class _$GalleryErrorContentWarning implements GalleryErrorContentWarning {
  const _$GalleryErrorContentWarning({@required this.reason})
      : assert(reason != null);

  @override
  final String reason;

  @override
  String toString() {
    return 'GalleryError.contentWarning(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryErrorContentWarning &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @override
  $GalleryErrorContentWarningCopyWith<GalleryErrorContentWarning>
      get copyWith =>
          _$GalleryErrorContentWarningCopyWithImpl<GalleryErrorContentWarning>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    return contentWarning(reason);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (contentWarning != null) {
      return contentWarning(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    return contentWarning(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (contentWarning != null) {
      return contentWarning(this);
    }
    return orElse();
  }
}

abstract class GalleryErrorContentWarning implements GalleryError {
  const factory GalleryErrorContentWarning({@required String reason}) =
      _$GalleryErrorContentWarning;

  String get reason;
  $GalleryErrorContentWarningCopyWith<GalleryErrorContentWarning> get copyWith;
}
