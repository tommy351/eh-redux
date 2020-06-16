// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (new Serializers().toBuilder()
      ..add(GitHubAsset.serializer)
      ..add(GitHubRelease.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GitHubAsset)]),
          () => new ListBuilder<GitHubAsset>()))
    .build();
Serializer<GitHubAsset> _$gitHubAssetSerializer = new _$GitHubAssetSerializer();
Serializer<GitHubRelease> _$gitHubReleaseSerializer =
    new _$GitHubReleaseSerializer();

class _$GitHubAssetSerializer implements StructuredSerializer<GitHubAsset> {
  @override
  final Iterable<Type> types = const [GitHubAsset, _$GitHubAsset];
  @override
  final String wireName = 'GitHubAsset';

  @override
  Iterable<Object> serialize(Serializers serializers, GitHubAsset object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'content_type',
      serializers.serialize(object.contentType,
          specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'browser_download_url',
      serializers.serialize(object.browserDownloadUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GitHubAsset deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GitHubAssetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content_type':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'browser_download_url':
          result.browserDownloadUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GitHubReleaseSerializer implements StructuredSerializer<GitHubRelease> {
  @override
  final Iterable<Type> types = const [GitHubRelease, _$GitHubRelease];
  @override
  final String wireName = 'GitHubRelease';

  @override
  Iterable<Object> serialize(Serializers serializers, GitHubRelease object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'tag_name',
      serializers.serialize(object.tagName,
          specifiedType: const FullType(String)),
      'html_url',
      serializers.serialize(object.htmlUrl,
          specifiedType: const FullType(String)),
      'assets',
      serializers.serialize(object.assets,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GitHubAsset)])),
    ];

    return result;
  }

  @override
  GitHubRelease deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GitHubReleaseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tag_name':
          result.tagName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'html_url':
          result.htmlUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assets':
          result.assets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GitHubAsset)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GitHubAsset extends GitHubAsset {
  @override
  final String name;
  @override
  final String contentType;
  @override
  final String state;
  @override
  final int size;
  @override
  final String browserDownloadUrl;

  factory _$GitHubAsset([void Function(GitHubAssetBuilder) updates]) =>
      (new GitHubAssetBuilder()..update(updates)).build();

  _$GitHubAsset._(
      {this.name,
      this.contentType,
      this.state,
      this.size,
      this.browserDownloadUrl})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GitHubAsset', 'name');
    }
    if (contentType == null) {
      throw new BuiltValueNullFieldError('GitHubAsset', 'contentType');
    }
    if (state == null) {
      throw new BuiltValueNullFieldError('GitHubAsset', 'state');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('GitHubAsset', 'size');
    }
    if (browserDownloadUrl == null) {
      throw new BuiltValueNullFieldError('GitHubAsset', 'browserDownloadUrl');
    }
  }

  @override
  GitHubAsset rebuild(void Function(GitHubAssetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GitHubAssetBuilder toBuilder() => new GitHubAssetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GitHubAsset &&
        name == other.name &&
        contentType == other.contentType &&
        state == other.state &&
        size == other.size &&
        browserDownloadUrl == other.browserDownloadUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), contentType.hashCode),
                state.hashCode),
            size.hashCode),
        browserDownloadUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GitHubAsset')
          ..add('name', name)
          ..add('contentType', contentType)
          ..add('state', state)
          ..add('size', size)
          ..add('browserDownloadUrl', browserDownloadUrl))
        .toString();
  }
}

class GitHubAssetBuilder implements Builder<GitHubAsset, GitHubAssetBuilder> {
  _$GitHubAsset _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _contentType;
  String get contentType => _$this._contentType;
  set contentType(String contentType) => _$this._contentType = contentType;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  String _browserDownloadUrl;
  String get browserDownloadUrl => _$this._browserDownloadUrl;
  set browserDownloadUrl(String browserDownloadUrl) =>
      _$this._browserDownloadUrl = browserDownloadUrl;

  GitHubAssetBuilder();

  GitHubAssetBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _contentType = _$v.contentType;
      _state = _$v.state;
      _size = _$v.size;
      _browserDownloadUrl = _$v.browserDownloadUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GitHubAsset other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GitHubAsset;
  }

  @override
  void update(void Function(GitHubAssetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GitHubAsset build() {
    final _$result = _$v ??
        new _$GitHubAsset._(
            name: name,
            contentType: contentType,
            state: state,
            size: size,
            browserDownloadUrl: browserDownloadUrl);
    replace(_$result);
    return _$result;
  }
}

class _$GitHubRelease extends GitHubRelease {
  @override
  final String name;
  @override
  final String body;
  @override
  final String tagName;
  @override
  final String htmlUrl;
  @override
  final BuiltList<GitHubAsset> assets;

  factory _$GitHubRelease([void Function(GitHubReleaseBuilder) updates]) =>
      (new GitHubReleaseBuilder()..update(updates)).build();

  _$GitHubRelease._(
      {this.name, this.body, this.tagName, this.htmlUrl, this.assets})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GitHubRelease', 'name');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('GitHubRelease', 'body');
    }
    if (tagName == null) {
      throw new BuiltValueNullFieldError('GitHubRelease', 'tagName');
    }
    if (htmlUrl == null) {
      throw new BuiltValueNullFieldError('GitHubRelease', 'htmlUrl');
    }
    if (assets == null) {
      throw new BuiltValueNullFieldError('GitHubRelease', 'assets');
    }
  }

  @override
  GitHubRelease rebuild(void Function(GitHubReleaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GitHubReleaseBuilder toBuilder() => new GitHubReleaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GitHubRelease &&
        name == other.name &&
        body == other.body &&
        tagName == other.tagName &&
        htmlUrl == other.htmlUrl &&
        assets == other.assets;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), body.hashCode), tagName.hashCode),
            htmlUrl.hashCode),
        assets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GitHubRelease')
          ..add('name', name)
          ..add('body', body)
          ..add('tagName', tagName)
          ..add('htmlUrl', htmlUrl)
          ..add('assets', assets))
        .toString();
  }
}

class GitHubReleaseBuilder
    implements Builder<GitHubRelease, GitHubReleaseBuilder> {
  _$GitHubRelease _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  String _tagName;
  String get tagName => _$this._tagName;
  set tagName(String tagName) => _$this._tagName = tagName;

  String _htmlUrl;
  String get htmlUrl => _$this._htmlUrl;
  set htmlUrl(String htmlUrl) => _$this._htmlUrl = htmlUrl;

  ListBuilder<GitHubAsset> _assets;
  ListBuilder<GitHubAsset> get assets =>
      _$this._assets ??= new ListBuilder<GitHubAsset>();
  set assets(ListBuilder<GitHubAsset> assets) => _$this._assets = assets;

  GitHubReleaseBuilder();

  GitHubReleaseBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _body = _$v.body;
      _tagName = _$v.tagName;
      _htmlUrl = _$v.htmlUrl;
      _assets = _$v.assets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GitHubRelease other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GitHubRelease;
  }

  @override
  void update(void Function(GitHubReleaseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GitHubRelease build() {
    _$GitHubRelease _$result;
    try {
      _$result = _$v ??
          new _$GitHubRelease._(
              name: name,
              body: body,
              tagName: tagName,
              htmlUrl: htmlUrl,
              assets: assets.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'assets';
        assets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GitHubRelease', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckUpdateStore on _CheckUpdateStoreBase, Store {
  Computed<UpdateStatus> _$statusComputed;

  @override
  UpdateStatus get status =>
      (_$statusComputed ??= Computed<UpdateStatus>(() => super.status,
              name: '_CheckUpdateStoreBase.status'))
          .value;

  final _$releaseFutureAtom = Atom(name: '_CheckUpdateStoreBase.releaseFuture');

  @override
  ObservableFuture<GitHubRelease> get releaseFuture {
    _$releaseFutureAtom.reportRead();
    return super.releaseFuture;
  }

  @override
  set releaseFuture(ObservableFuture<GitHubRelease> value) {
    _$releaseFutureAtom.reportWrite(value, super.releaseFuture, () {
      super.releaseFuture = value;
    });
  }

  final _$packageInfoFutureAtom =
      Atom(name: '_CheckUpdateStoreBase.packageInfoFuture');

  @override
  ObservableFuture<PackageInfo> get packageInfoFuture {
    _$packageInfoFutureAtom.reportRead();
    return super.packageInfoFuture;
  }

  @override
  set packageInfoFuture(ObservableFuture<PackageInfo> value) {
    _$packageInfoFutureAtom.reportWrite(value, super.packageInfoFuture, () {
      super.packageInfoFuture = value;
    });
  }

  final _$_CheckUpdateStoreBaseActionController =
      ActionController(name: '_CheckUpdateStoreBase');

  @override
  void check() {
    final _$actionInfo = _$_CheckUpdateStoreBaseActionController.startAction(
        name: '_CheckUpdateStoreBase.check');
    try {
      return super.check();
    } finally {
      _$_CheckUpdateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
releaseFuture: ${releaseFuture},
packageInfoFuture: ${packageInfoFuture},
status: ${status}
    ''';
  }
}
