// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageId> _$imageIdSerializer = new _$ImageIdSerializer();
Serializer<Image> _$imageSerializer = new _$ImageSerializer();

class _$ImageIdSerializer implements StructuredSerializer<ImageId> {
  @override
  final Iterable<Type> types = const [ImageId, _$ImageId];
  @override
  final String wireName = 'ImageId';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'galleryId',
      serializers.serialize(object.galleryId,
          specifiedType: const FullType(GalleryId)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ImageId deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'galleryId':
          result.galleryId.replace(serializers.deserialize(value,
              specifiedType: const FullType(GalleryId)) as GalleryId);
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageSerializer implements StructuredSerializer<Image> {
  @override
  final Iterable<Type> types = const [Image, _$Image];
  @override
  final String wireName = 'Image';

  @override
  Iterable<Object> serialize(Serializers serializers, Image object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(ImageId)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Image deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(ImageId)) as ImageId);
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageId extends ImageId {
  @override
  final GalleryId galleryId;
  @override
  final int page;
  @override
  final String key;

  factory _$ImageId([void Function(ImageIdBuilder) updates]) =>
      (new ImageIdBuilder()..update(updates)).build();

  _$ImageId._({this.galleryId, this.page, this.key}) : super._() {
    if (galleryId == null) {
      throw new BuiltValueNullFieldError('ImageId', 'galleryId');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('ImageId', 'page');
    }
    if (key == null) {
      throw new BuiltValueNullFieldError('ImageId', 'key');
    }
  }

  @override
  ImageId rebuild(void Function(ImageIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageIdBuilder toBuilder() => new ImageIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageId &&
        galleryId == other.galleryId &&
        page == other.page &&
        key == other.key;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, galleryId.hashCode), page.hashCode), key.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageId')
          ..add('galleryId', galleryId)
          ..add('page', page)
          ..add('key', key))
        .toString();
  }
}

class ImageIdBuilder implements Builder<ImageId, ImageIdBuilder> {
  _$ImageId _$v;

  GalleryIdBuilder _galleryId;
  GalleryIdBuilder get galleryId =>
      _$this._galleryId ??= new GalleryIdBuilder();
  set galleryId(GalleryIdBuilder galleryId) => _$this._galleryId = galleryId;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  ImageIdBuilder();

  ImageIdBuilder get _$this {
    if (_$v != null) {
      _galleryId = _$v.galleryId?.toBuilder();
      _page = _$v.page;
      _key = _$v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageId other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageId;
  }

  @override
  void update(void Function(ImageIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageId build() {
    _$ImageId _$result;
    try {
      _$result = _$v ??
          new _$ImageId._(galleryId: galleryId.build(), page: page, key: key);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'galleryId';
        galleryId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ImageId', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Image extends Image {
  @override
  final ImageId id;
  @override
  final int width;
  @override
  final int height;
  @override
  final String url;

  factory _$Image([void Function(ImageBuilder) updates]) =>
      (new ImageBuilder()..update(updates)).build();

  _$Image._({this.id, this.width, this.height, this.url}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Image', 'id');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('Image', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('Image', 'height');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Image', 'url');
    }
  }

  @override
  Image rebuild(void Function(ImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageBuilder toBuilder() => new ImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Image &&
        id == other.id &&
        width == other.width &&
        height == other.height &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), width.hashCode), height.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Image')
          ..add('id', id)
          ..add('width', width)
          ..add('height', height)
          ..add('url', url))
        .toString();
  }
}

class ImageBuilder implements Builder<Image, ImageBuilder> {
  _$Image _$v;

  ImageIdBuilder _id;
  ImageIdBuilder get id => _$this._id ??= new ImageIdBuilder();
  set id(ImageIdBuilder id) => _$this._id = id;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ImageBuilder();

  ImageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id?.toBuilder();
      _width = _$v.width;
      _height = _$v.height;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Image other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Image;
  }

  @override
  void update(void Function(ImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Image build() {
    _$Image _$result;
    try {
      _$result = _$v ??
          new _$Image._(id: id.build(), width: width, height: height, url: url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'id';
        id.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Image', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
