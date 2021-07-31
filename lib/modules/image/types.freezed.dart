// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImageIdTearOff {
  const _$ImageIdTearOff();

  _ImageId call(
      {required GalleryId galleryId, required int page, required String key}) {
    return _ImageId(
      galleryId: galleryId,
      page: page,
      key: key,
    );
  }
}

/// @nodoc
const $ImageId = _$ImageIdTearOff();

/// @nodoc
mixin _$ImageId {
  GalleryId get galleryId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageIdCopyWith<ImageId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageIdCopyWith<$Res> {
  factory $ImageIdCopyWith(ImageId value, $Res Function(ImageId) then) =
      _$ImageIdCopyWithImpl<$Res>;
  $Res call({GalleryId galleryId, int page, String key});

  $GalleryIdCopyWith<$Res> get galleryId;
}

/// @nodoc
class _$ImageIdCopyWithImpl<$Res> implements $ImageIdCopyWith<$Res> {
  _$ImageIdCopyWithImpl(this._value, this._then);

  final ImageId _value;
  // ignore: unused_field
  final $Res Function(ImageId) _then;

  @override
  $Res call({
    Object? galleryId = freezed,
    Object? page = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId: galleryId == freezed
          ? _value.galleryId
          : galleryId // ignore: cast_nullable_to_non_nullable
              as GalleryId,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $GalleryIdCopyWith<$Res> get galleryId {
    return $GalleryIdCopyWith<$Res>(_value.galleryId, (value) {
      return _then(_value.copyWith(galleryId: value));
    });
  }
}

/// @nodoc
abstract class _$ImageIdCopyWith<$Res> implements $ImageIdCopyWith<$Res> {
  factory _$ImageIdCopyWith(_ImageId value, $Res Function(_ImageId) then) =
      __$ImageIdCopyWithImpl<$Res>;
  @override
  $Res call({GalleryId galleryId, int page, String key});

  @override
  $GalleryIdCopyWith<$Res> get galleryId;
}

/// @nodoc
class __$ImageIdCopyWithImpl<$Res> extends _$ImageIdCopyWithImpl<$Res>
    implements _$ImageIdCopyWith<$Res> {
  __$ImageIdCopyWithImpl(_ImageId _value, $Res Function(_ImageId) _then)
      : super(_value, (v) => _then(v as _ImageId));

  @override
  _ImageId get _value => super._value as _ImageId;

  @override
  $Res call({
    Object? galleryId = freezed,
    Object? page = freezed,
    Object? key = freezed,
  }) {
    return _then(_ImageId(
      galleryId: galleryId == freezed
          ? _value.galleryId
          : galleryId // ignore: cast_nullable_to_non_nullable
              as GalleryId,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ImageId extends _ImageId {
  _$_ImageId({required this.galleryId, required this.page, required this.key})
      : super._();

  @override
  final GalleryId galleryId;
  @override
  final int page;
  @override
  final String key;

  @override
  String toString() {
    return 'ImageId(galleryId: $galleryId, page: $page, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageId &&
            (identical(other.galleryId, galleryId) ||
                const DeepCollectionEquality()
                    .equals(other.galleryId, galleryId)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(galleryId) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(key);

  @JsonKey(ignore: true)
  @override
  _$ImageIdCopyWith<_ImageId> get copyWith =>
      __$ImageIdCopyWithImpl<_ImageId>(this, _$identity);
}

abstract class _ImageId extends ImageId {
  factory _ImageId(
      {required GalleryId galleryId,
      required int page,
      required String key}) = _$_ImageId;
  _ImageId._() : super._();

  @override
  GalleryId get galleryId => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  String get key => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageIdCopyWith<_ImageId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GalleryImageTearOff {
  const _$GalleryImageTearOff();

  NetworkGalleryImage network(
      {required ImageId id,
      required int width,
      required int height,
      required String url,
      String? reloadKey}) {
    return NetworkGalleryImage(
      id: id,
      width: width,
      height: height,
      url: url,
      reloadKey: reloadKey,
    );
  }

  LocalGalleryImage local(
      {required ImageId id,
      required int width,
      required int height,
      required String path}) {
    return LocalGalleryImage(
      id: id,
      width: width,
      height: height,
      path: path,
    );
  }
}

/// @nodoc
const $GalleryImage = _$GalleryImageTearOff();

/// @nodoc
mixin _$GalleryImage {
  ImageId get id => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ImageId id, int width, int height, String url, String? reloadKey)
        network,
    required TResult Function(ImageId id, int width, int height, String path)
        local,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ImageId id, int width, int height, String url, String? reloadKey)?
        network,
    TResult Function(ImageId id, int width, int height, String path)? local,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkGalleryImage value) network,
    required TResult Function(LocalGalleryImage value) local,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkGalleryImage value)? network,
    TResult Function(LocalGalleryImage value)? local,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryImageCopyWith<GalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryImageCopyWith<$Res> {
  factory $GalleryImageCopyWith(
          GalleryImage value, $Res Function(GalleryImage) then) =
      _$GalleryImageCopyWithImpl<$Res>;
  $Res call({ImageId id, int width, int height});

  $ImageIdCopyWith<$Res> get id;
}

/// @nodoc
class _$GalleryImageCopyWithImpl<$Res> implements $GalleryImageCopyWith<$Res> {
  _$GalleryImageCopyWithImpl(this._value, this._then);

  final GalleryImage _value;
  // ignore: unused_field
  final $Res Function(GalleryImage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ImageId,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ImageIdCopyWith<$Res> get id {
    return $ImageIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class $NetworkGalleryImageCopyWith<$Res>
    implements $GalleryImageCopyWith<$Res> {
  factory $NetworkGalleryImageCopyWith(
          NetworkGalleryImage value, $Res Function(NetworkGalleryImage) then) =
      _$NetworkGalleryImageCopyWithImpl<$Res>;
  @override
  $Res call({ImageId id, int width, int height, String url, String? reloadKey});

  @override
  $ImageIdCopyWith<$Res> get id;
}

/// @nodoc
class _$NetworkGalleryImageCopyWithImpl<$Res>
    extends _$GalleryImageCopyWithImpl<$Res>
    implements $NetworkGalleryImageCopyWith<$Res> {
  _$NetworkGalleryImageCopyWithImpl(
      NetworkGalleryImage _value, $Res Function(NetworkGalleryImage) _then)
      : super(_value, (v) => _then(v as NetworkGalleryImage));

  @override
  NetworkGalleryImage get _value => super._value as NetworkGalleryImage;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? reloadKey = freezed,
  }) {
    return _then(NetworkGalleryImage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ImageId,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      reloadKey: reloadKey == freezed
          ? _value.reloadKey
          : reloadKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkGalleryImage implements NetworkGalleryImage {
  const _$NetworkGalleryImage(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      this.reloadKey});

  @override
  final ImageId id;
  @override
  final int width;
  @override
  final int height;
  @override
  final String url;
  @override
  final String? reloadKey;

  @override
  String toString() {
    return 'GalleryImage.network(id: $id, width: $width, height: $height, url: $url, reloadKey: $reloadKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NetworkGalleryImage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.reloadKey, reloadKey) ||
                const DeepCollectionEquality()
                    .equals(other.reloadKey, reloadKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(reloadKey);

  @JsonKey(ignore: true)
  @override
  $NetworkGalleryImageCopyWith<NetworkGalleryImage> get copyWith =>
      _$NetworkGalleryImageCopyWithImpl<NetworkGalleryImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ImageId id, int width, int height, String url, String? reloadKey)
        network,
    required TResult Function(ImageId id, int width, int height, String path)
        local,
  }) {
    return network(id, width, height, url, reloadKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ImageId id, int width, int height, String url, String? reloadKey)?
        network,
    TResult Function(ImageId id, int width, int height, String path)? local,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(id, width, height, url, reloadKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkGalleryImage value) network,
    required TResult Function(LocalGalleryImage value) local,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkGalleryImage value)? network,
    TResult Function(LocalGalleryImage value)? local,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkGalleryImage implements GalleryImage {
  const factory NetworkGalleryImage(
      {required ImageId id,
      required int width,
      required int height,
      required String url,
      String? reloadKey}) = _$NetworkGalleryImage;

  @override
  ImageId get id => throw _privateConstructorUsedError;
  @override
  int get width => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get reloadKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $NetworkGalleryImageCopyWith<NetworkGalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalGalleryImageCopyWith<$Res>
    implements $GalleryImageCopyWith<$Res> {
  factory $LocalGalleryImageCopyWith(
          LocalGalleryImage value, $Res Function(LocalGalleryImage) then) =
      _$LocalGalleryImageCopyWithImpl<$Res>;
  @override
  $Res call({ImageId id, int width, int height, String path});

  @override
  $ImageIdCopyWith<$Res> get id;
}

/// @nodoc
class _$LocalGalleryImageCopyWithImpl<$Res>
    extends _$GalleryImageCopyWithImpl<$Res>
    implements $LocalGalleryImageCopyWith<$Res> {
  _$LocalGalleryImageCopyWithImpl(
      LocalGalleryImage _value, $Res Function(LocalGalleryImage) _then)
      : super(_value, (v) => _then(v as LocalGalleryImage));

  @override
  LocalGalleryImage get _value => super._value as LocalGalleryImage;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? path = freezed,
  }) {
    return _then(LocalGalleryImage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ImageId,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocalGalleryImage implements LocalGalleryImage {
  const _$LocalGalleryImage(
      {required this.id,
      required this.width,
      required this.height,
      required this.path});

  @override
  final ImageId id;
  @override
  final int width;
  @override
  final int height;
  @override
  final String path;

  @override
  String toString() {
    return 'GalleryImage.local(id: $id, width: $width, height: $height, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocalGalleryImage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  $LocalGalleryImageCopyWith<LocalGalleryImage> get copyWith =>
      _$LocalGalleryImageCopyWithImpl<LocalGalleryImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ImageId id, int width, int height, String url, String? reloadKey)
        network,
    required TResult Function(ImageId id, int width, int height, String path)
        local,
  }) {
    return local(id, width, height, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ImageId id, int width, int height, String url, String? reloadKey)?
        network,
    TResult Function(ImageId id, int width, int height, String path)? local,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(id, width, height, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkGalleryImage value) network,
    required TResult Function(LocalGalleryImage value) local,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkGalleryImage value)? network,
    TResult Function(LocalGalleryImage value)? local,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class LocalGalleryImage implements GalleryImage {
  const factory LocalGalleryImage(
      {required ImageId id,
      required int width,
      required int height,
      required String path}) = _$LocalGalleryImage;

  @override
  ImageId get id => throw _privateConstructorUsedError;
  @override
  int get width => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LocalGalleryImageCopyWith<LocalGalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}
