// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ImageIdTearOff {
  const _$ImageIdTearOff();

// ignore: unused_element
  _ImageId call(
      {@required GalleryId galleryId,
      @required int page,
      @required String key}) {
    return _ImageId(
      galleryId: galleryId,
      page: page,
      key: key,
    );
  }
}

// ignore: unused_element
const $ImageId = _$ImageIdTearOff();

mixin _$ImageId {
  GalleryId get galleryId;
  int get page;
  String get key;

  $ImageIdCopyWith<ImageId> get copyWith;
}

abstract class $ImageIdCopyWith<$Res> {
  factory $ImageIdCopyWith(ImageId value, $Res Function(ImageId) then) =
      _$ImageIdCopyWithImpl<$Res>;
  $Res call({GalleryId galleryId, int page, String key});

  $GalleryIdCopyWith<$Res> get galleryId;
}

class _$ImageIdCopyWithImpl<$Res> implements $ImageIdCopyWith<$Res> {
  _$ImageIdCopyWithImpl(this._value, this._then);

  final ImageId _value;
  // ignore: unused_field
  final $Res Function(ImageId) _then;

  @override
  $Res call({
    Object galleryId = freezed,
    Object page = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId:
          galleryId == freezed ? _value.galleryId : galleryId as GalleryId,
      page: page == freezed ? _value.page : page as int,
      key: key == freezed ? _value.key : key as String,
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

abstract class _$ImageIdCopyWith<$Res> implements $ImageIdCopyWith<$Res> {
  factory _$ImageIdCopyWith(_ImageId value, $Res Function(_ImageId) then) =
      __$ImageIdCopyWithImpl<$Res>;
  @override
  $Res call({GalleryId galleryId, int page, String key});

  @override
  $GalleryIdCopyWith<$Res> get galleryId;
}

class __$ImageIdCopyWithImpl<$Res> extends _$ImageIdCopyWithImpl<$Res>
    implements _$ImageIdCopyWith<$Res> {
  __$ImageIdCopyWithImpl(_ImageId _value, $Res Function(_ImageId) _then)
      : super(_value, (v) => _then(v as _ImageId));

  @override
  _ImageId get _value => super._value as _ImageId;

  @override
  $Res call({
    Object galleryId = freezed,
    Object page = freezed,
    Object key = freezed,
  }) {
    return _then(_ImageId(
      galleryId:
          galleryId == freezed ? _value.galleryId : galleryId as GalleryId,
      page: page == freezed ? _value.page : page as int,
      key: key == freezed ? _value.key : key as String,
    ));
  }
}

class _$_ImageId extends _ImageId {
  const _$_ImageId(
      {@required this.galleryId, @required this.page, @required this.key})
      : assert(galleryId != null),
        assert(page != null),
        assert(key != null),
        super._();

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

  @override
  _$ImageIdCopyWith<_ImageId> get copyWith =>
      __$ImageIdCopyWithImpl<_ImageId>(this, _$identity);
}

abstract class _ImageId extends ImageId {
  const _ImageId._() : super._();
  const factory _ImageId(
      {@required GalleryId galleryId,
      @required int page,
      @required String key}) = _$_ImageId;

  @override
  GalleryId get galleryId;
  @override
  int get page;
  @override
  String get key;
  @override
  _$ImageIdCopyWith<_ImageId> get copyWith;
}

class _$GalleryImageTearOff {
  const _$GalleryImageTearOff();

// ignore: unused_element
  NetworkGalleryImage network(
      {@required ImageId id,
      int width,
      int height,
      @required String url,
      String reloadKey}) {
    return NetworkGalleryImage(
      id: id,
      width: width,
      height: height,
      url: url,
      reloadKey: reloadKey,
    );
  }

// ignore: unused_element
  LocalGalleryImage local(
      {@required ImageId id,
      @required int width,
      @required int height,
      @required String path}) {
    return LocalGalleryImage(
      id: id,
      width: width,
      height: height,
      path: path,
    );
  }
}

// ignore: unused_element
const $GalleryImage = _$GalleryImageTearOff();

mixin _$GalleryImage {
  ImageId get id;
  int get width;
  int get height;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result network(
            ImageId id, int width, int height, String url, String reloadKey),
    @required Result local(ImageId id, int width, int height, String path),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result network(
        ImageId id, int width, int height, String url, String reloadKey),
    Result local(ImageId id, int width, int height, String path),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result network(NetworkGalleryImage value),
    @required Result local(LocalGalleryImage value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result network(NetworkGalleryImage value),
    Result local(LocalGalleryImage value),
    @required Result orElse(),
  });

  $GalleryImageCopyWith<GalleryImage> get copyWith;
}

abstract class $GalleryImageCopyWith<$Res> {
  factory $GalleryImageCopyWith(
          GalleryImage value, $Res Function(GalleryImage) then) =
      _$GalleryImageCopyWithImpl<$Res>;
  $Res call({ImageId id, int width, int height});

  $ImageIdCopyWith<$Res> get id;
}

class _$GalleryImageCopyWithImpl<$Res> implements $GalleryImageCopyWith<$Res> {
  _$GalleryImageCopyWithImpl(this._value, this._then);

  final GalleryImage _value;
  // ignore: unused_field
  final $Res Function(GalleryImage) _then;

  @override
  $Res call({
    Object id = freezed,
    Object width = freezed,
    Object height = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as ImageId,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
    ));
  }

  @override
  $ImageIdCopyWith<$Res> get id {
    if (_value.id == null) {
      return null;
    }
    return $ImageIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

abstract class $NetworkGalleryImageCopyWith<$Res>
    implements $GalleryImageCopyWith<$Res> {
  factory $NetworkGalleryImageCopyWith(
          NetworkGalleryImage value, $Res Function(NetworkGalleryImage) then) =
      _$NetworkGalleryImageCopyWithImpl<$Res>;
  @override
  $Res call({ImageId id, int width, int height, String url, String reloadKey});

  @override
  $ImageIdCopyWith<$Res> get id;
}

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
    Object id = freezed,
    Object width = freezed,
    Object height = freezed,
    Object url = freezed,
    Object reloadKey = freezed,
  }) {
    return _then(NetworkGalleryImage(
      id: id == freezed ? _value.id : id as ImageId,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      url: url == freezed ? _value.url : url as String,
      reloadKey: reloadKey == freezed ? _value.reloadKey : reloadKey as String,
    ));
  }
}

class _$NetworkGalleryImage implements NetworkGalleryImage {
  const _$NetworkGalleryImage(
      {@required this.id,
      this.width,
      this.height,
      @required this.url,
      this.reloadKey})
      : assert(id != null),
        assert(url != null);

  @override
  final ImageId id;
  @override
  final int width;
  @override
  final int height;
  @override
  final String url;
  @override
  final String reloadKey;

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

  @override
  $NetworkGalleryImageCopyWith<NetworkGalleryImage> get copyWith =>
      _$NetworkGalleryImageCopyWithImpl<NetworkGalleryImage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result network(
            ImageId id, int width, int height, String url, String reloadKey),
    @required Result local(ImageId id, int width, int height, String path),
  }) {
    assert(network != null);
    assert(local != null);
    return network(id, width, height, url, reloadKey);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result network(
        ImageId id, int width, int height, String url, String reloadKey),
    Result local(ImageId id, int width, int height, String path),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network(id, width, height, url, reloadKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result network(NetworkGalleryImage value),
    @required Result local(LocalGalleryImage value),
  }) {
    assert(network != null);
    assert(local != null);
    return network(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result network(NetworkGalleryImage value),
    Result local(LocalGalleryImage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkGalleryImage implements GalleryImage {
  const factory NetworkGalleryImage(
      {@required ImageId id,
      int width,
      int height,
      @required String url,
      String reloadKey}) = _$NetworkGalleryImage;

  @override
  ImageId get id;
  @override
  int get width;
  @override
  int get height;
  String get url;
  String get reloadKey;
  @override
  $NetworkGalleryImageCopyWith<NetworkGalleryImage> get copyWith;
}

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
    Object id = freezed,
    Object width = freezed,
    Object height = freezed,
    Object path = freezed,
  }) {
    return _then(LocalGalleryImage(
      id: id == freezed ? _value.id : id as ImageId,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      path: path == freezed ? _value.path : path as String,
    ));
  }
}

class _$LocalGalleryImage implements LocalGalleryImage {
  const _$LocalGalleryImage(
      {@required this.id,
      @required this.width,
      @required this.height,
      @required this.path})
      : assert(id != null),
        assert(width != null),
        assert(height != null),
        assert(path != null);

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

  @override
  $LocalGalleryImageCopyWith<LocalGalleryImage> get copyWith =>
      _$LocalGalleryImageCopyWithImpl<LocalGalleryImage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result network(
            ImageId id, int width, int height, String url, String reloadKey),
    @required Result local(ImageId id, int width, int height, String path),
  }) {
    assert(network != null);
    assert(local != null);
    return local(id, width, height, path);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result network(
        ImageId id, int width, int height, String url, String reloadKey),
    Result local(ImageId id, int width, int height, String path),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (local != null) {
      return local(id, width, height, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result network(NetworkGalleryImage value),
    @required Result local(LocalGalleryImage value),
  }) {
    assert(network != null);
    assert(local != null);
    return local(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result network(NetworkGalleryImage value),
    Result local(LocalGalleryImage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class LocalGalleryImage implements GalleryImage {
  const factory LocalGalleryImage(
      {@required ImageId id,
      @required int width,
      @required int height,
      @required String path}) = _$LocalGalleryImage;

  @override
  ImageId get id;
  @override
  int get width;
  @override
  int get height;
  String get path;
  @override
  $LocalGalleryImageCopyWith<LocalGalleryImage> get copyWith;
}
