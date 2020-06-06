// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Gallery> _$gallerySerializer = new _$GallerySerializer();
Serializer<GalleryId> _$galleryIdSerializer = new _$GalleryIdSerializer();
Serializer<GalleryIdWithPage> _$galleryIdWithPageSerializer =
    new _$GalleryIdWithPageSerializer();

class _$GallerySerializer implements StructuredSerializer<Gallery> {
  @override
  final Iterable<Type> types = const [Gallery, _$Gallery];
  @override
  final String wireName = 'Gallery';

  @override
  Iterable<Object> serialize(Serializers serializers, Gallery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(GalleryId)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'titleJpn',
      serializers.serialize(object.titleJpn,
          specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'uploader',
      serializers.serialize(object.uploader,
          specifiedType: const FullType(String)),
      'fileCount',
      serializers.serialize(object.fileCount,
          specifiedType: const FullType(int)),
      'fileSize',
      serializers.serialize(object.fileSize,
          specifiedType: const FullType(int)),
      'expunged',
      serializers.serialize(object.expunged,
          specifiedType: const FullType(bool)),
      'rating',
      serializers.serialize(object.rating,
          specifiedType: const FullType(double)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'posted',
      serializers.serialize(object.posted,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Gallery deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(GalleryId)) as GalleryId);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'titleJpn':
          result.titleJpn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uploader':
          result.uploader = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fileCount':
          result.fileCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fileSize':
          result.fileSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'expunged':
          result.expunged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'posted':
          result.posted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$GalleryIdSerializer implements StructuredSerializer<GalleryId> {
  @override
  final Iterable<Type> types = const [GalleryId, _$GalleryId];
  @override
  final String wireName = 'GalleryId';

  @override
  Iterable<Object> serialize(Serializers serializers, GalleryId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GalleryId deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GalleryIdWithPageSerializer
    implements StructuredSerializer<GalleryIdWithPage> {
  @override
  final Iterable<Type> types = const [GalleryIdWithPage, _$GalleryIdWithPage];
  @override
  final String wireName = 'GalleryIdWithPage';

  @override
  Iterable<Object> serialize(Serializers serializers, GalleryIdWithPage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'galleryId',
      serializers.serialize(object.galleryId,
          specifiedType: const FullType(GalleryId)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GalleryIdWithPage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryIdWithPageBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Gallery extends Gallery {
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
  final BuiltList<String> tags;
  @override
  final DateTime posted;

  factory _$Gallery([void Function(GalleryBuilder) updates]) =>
      (new GalleryBuilder()..update(updates)).build();

  _$Gallery._(
      {this.id,
      this.title,
      this.titleJpn,
      this.category,
      this.thumbnail,
      this.uploader,
      this.fileCount,
      this.fileSize,
      this.expunged,
      this.rating,
      this.tags,
      this.posted})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Gallery', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Gallery', 'title');
    }
    if (titleJpn == null) {
      throw new BuiltValueNullFieldError('Gallery', 'titleJpn');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('Gallery', 'category');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Gallery', 'thumbnail');
    }
    if (uploader == null) {
      throw new BuiltValueNullFieldError('Gallery', 'uploader');
    }
    if (fileCount == null) {
      throw new BuiltValueNullFieldError('Gallery', 'fileCount');
    }
    if (fileSize == null) {
      throw new BuiltValueNullFieldError('Gallery', 'fileSize');
    }
    if (expunged == null) {
      throw new BuiltValueNullFieldError('Gallery', 'expunged');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('Gallery', 'rating');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('Gallery', 'tags');
    }
    if (posted == null) {
      throw new BuiltValueNullFieldError('Gallery', 'posted');
    }
  }

  @override
  Gallery rebuild(void Function(GalleryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryBuilder toBuilder() => new GalleryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gallery &&
        id == other.id &&
        title == other.title &&
        titleJpn == other.titleJpn &&
        category == other.category &&
        thumbnail == other.thumbnail &&
        uploader == other.uploader &&
        fileCount == other.fileCount &&
        fileSize == other.fileSize &&
        expunged == other.expunged &&
        rating == other.rating &&
        tags == other.tags &&
        posted == other.posted;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                title.hashCode),
                                            titleJpn.hashCode),
                                        category.hashCode),
                                    thumbnail.hashCode),
                                uploader.hashCode),
                            fileCount.hashCode),
                        fileSize.hashCode),
                    expunged.hashCode),
                rating.hashCode),
            tags.hashCode),
        posted.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Gallery')
          ..add('id', id)
          ..add('title', title)
          ..add('titleJpn', titleJpn)
          ..add('category', category)
          ..add('thumbnail', thumbnail)
          ..add('uploader', uploader)
          ..add('fileCount', fileCount)
          ..add('fileSize', fileSize)
          ..add('expunged', expunged)
          ..add('rating', rating)
          ..add('tags', tags)
          ..add('posted', posted))
        .toString();
  }
}

class GalleryBuilder implements Builder<Gallery, GalleryBuilder> {
  _$Gallery _$v;

  GalleryIdBuilder _id;
  GalleryIdBuilder get id => _$this._id ??= new GalleryIdBuilder();
  set id(GalleryIdBuilder id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _titleJpn;
  String get titleJpn => _$this._titleJpn;
  set titleJpn(String titleJpn) => _$this._titleJpn = titleJpn;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  String _uploader;
  String get uploader => _$this._uploader;
  set uploader(String uploader) => _$this._uploader = uploader;

  int _fileCount;
  int get fileCount => _$this._fileCount;
  set fileCount(int fileCount) => _$this._fileCount = fileCount;

  int _fileSize;
  int get fileSize => _$this._fileSize;
  set fileSize(int fileSize) => _$this._fileSize = fileSize;

  bool _expunged;
  bool get expunged => _$this._expunged;
  set expunged(bool expunged) => _$this._expunged = expunged;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  DateTime _posted;
  DateTime get posted => _$this._posted;
  set posted(DateTime posted) => _$this._posted = posted;

  GalleryBuilder();

  GalleryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id?.toBuilder();
      _title = _$v.title;
      _titleJpn = _$v.titleJpn;
      _category = _$v.category;
      _thumbnail = _$v.thumbnail;
      _uploader = _$v.uploader;
      _fileCount = _$v.fileCount;
      _fileSize = _$v.fileSize;
      _expunged = _$v.expunged;
      _rating = _$v.rating;
      _tags = _$v.tags?.toBuilder();
      _posted = _$v.posted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Gallery other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Gallery;
  }

  @override
  void update(void Function(GalleryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Gallery build() {
    _$Gallery _$result;
    try {
      _$result = _$v ??
          new _$Gallery._(
              id: id.build(),
              title: title,
              titleJpn: titleJpn,
              category: category,
              thumbnail: thumbnail,
              uploader: uploader,
              fileCount: fileCount,
              fileSize: fileSize,
              expunged: expunged,
              rating: rating,
              tags: tags.build(),
              posted: posted);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'id';
        id.build();

        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Gallery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GalleryId extends GalleryId {
  @override
  final int id;
  @override
  final String token;

  factory _$GalleryId([void Function(GalleryIdBuilder) updates]) =>
      (new GalleryIdBuilder()..update(updates)).build();

  _$GalleryId._({this.id, this.token}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('GalleryId', 'id');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('GalleryId', 'token');
    }
  }

  @override
  GalleryId rebuild(void Function(GalleryIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryIdBuilder toBuilder() => new GalleryIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryId && id == other.id && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryId')
          ..add('id', id)
          ..add('token', token))
        .toString();
  }
}

class GalleryIdBuilder implements Builder<GalleryId, GalleryIdBuilder> {
  _$GalleryId _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  GalleryIdBuilder();

  GalleryIdBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryId other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryId;
  }

  @override
  void update(void Function(GalleryIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryId build() {
    final _$result = _$v ?? new _$GalleryId._(id: id, token: token);
    replace(_$result);
    return _$result;
  }
}

class _$GalleryIdWithPage extends GalleryIdWithPage {
  @override
  final GalleryId galleryId;
  @override
  final int page;

  factory _$GalleryIdWithPage(
          [void Function(GalleryIdWithPageBuilder) updates]) =>
      (new GalleryIdWithPageBuilder()..update(updates)).build();

  _$GalleryIdWithPage._({this.galleryId, this.page}) : super._() {
    if (galleryId == null) {
      throw new BuiltValueNullFieldError('GalleryIdWithPage', 'galleryId');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('GalleryIdWithPage', 'page');
    }
  }

  @override
  GalleryIdWithPage rebuild(void Function(GalleryIdWithPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryIdWithPageBuilder toBuilder() =>
      new GalleryIdWithPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryIdWithPage &&
        galleryId == other.galleryId &&
        page == other.page;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, galleryId.hashCode), page.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryIdWithPage')
          ..add('galleryId', galleryId)
          ..add('page', page))
        .toString();
  }
}

class GalleryIdWithPageBuilder
    implements Builder<GalleryIdWithPage, GalleryIdWithPageBuilder> {
  _$GalleryIdWithPage _$v;

  GalleryIdBuilder _galleryId;
  GalleryIdBuilder get galleryId =>
      _$this._galleryId ??= new GalleryIdBuilder();
  set galleryId(GalleryIdBuilder galleryId) => _$this._galleryId = galleryId;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  GalleryIdWithPageBuilder();

  GalleryIdWithPageBuilder get _$this {
    if (_$v != null) {
      _galleryId = _$v.galleryId?.toBuilder();
      _page = _$v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryIdWithPage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryIdWithPage;
  }

  @override
  void update(void Function(GalleryIdWithPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryIdWithPage build() {
    _$GalleryIdWithPage _$result;
    try {
      _$result = _$v ??
          new _$GalleryIdWithPage._(galleryId: galleryId.build(), page: page);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'galleryId';
        galleryId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GalleryIdWithPage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
