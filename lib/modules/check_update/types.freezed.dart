// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GitHubAsset _$GitHubAssetFromJson(Map<String, dynamic> json) {
  return _GitHubAsset.fromJson(json);
}

class _$GitHubAssetTearOff {
  const _$GitHubAssetTearOff();

// ignore: unused_element
  _GitHubAsset call(
      {String name,
      String contentType,
      String state,
      int size,
      String browserDownloadUrl}) {
    return _GitHubAsset(
      name: name,
      contentType: contentType,
      state: state,
      size: size,
      browserDownloadUrl: browserDownloadUrl,
    );
  }
}

// ignore: unused_element
const $GitHubAsset = _$GitHubAssetTearOff();

mixin _$GitHubAsset {
  String get name;
  String get contentType;
  String get state;
  int get size;
  String get browserDownloadUrl;

  Map<String, dynamic> toJson();
  $GitHubAssetCopyWith<GitHubAsset> get copyWith;
}

abstract class $GitHubAssetCopyWith<$Res> {
  factory $GitHubAssetCopyWith(
          GitHubAsset value, $Res Function(GitHubAsset) then) =
      _$GitHubAssetCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String contentType,
      String state,
      int size,
      String browserDownloadUrl});
}

class _$GitHubAssetCopyWithImpl<$Res> implements $GitHubAssetCopyWith<$Res> {
  _$GitHubAssetCopyWithImpl(this._value, this._then);

  final GitHubAsset _value;
  // ignore: unused_field
  final $Res Function(GitHubAsset) _then;

  @override
  $Res call({
    Object name = freezed,
    Object contentType = freezed,
    Object state = freezed,
    Object size = freezed,
    Object browserDownloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      contentType:
          contentType == freezed ? _value.contentType : contentType as String,
      state: state == freezed ? _value.state : state as String,
      size: size == freezed ? _value.size : size as int,
      browserDownloadUrl: browserDownloadUrl == freezed
          ? _value.browserDownloadUrl
          : browserDownloadUrl as String,
    ));
  }
}

abstract class _$GitHubAssetCopyWith<$Res>
    implements $GitHubAssetCopyWith<$Res> {
  factory _$GitHubAssetCopyWith(
          _GitHubAsset value, $Res Function(_GitHubAsset) then) =
      __$GitHubAssetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String contentType,
      String state,
      int size,
      String browserDownloadUrl});
}

class __$GitHubAssetCopyWithImpl<$Res> extends _$GitHubAssetCopyWithImpl<$Res>
    implements _$GitHubAssetCopyWith<$Res> {
  __$GitHubAssetCopyWithImpl(
      _GitHubAsset _value, $Res Function(_GitHubAsset) _then)
      : super(_value, (v) => _then(v as _GitHubAsset));

  @override
  _GitHubAsset get _value => super._value as _GitHubAsset;

  @override
  $Res call({
    Object name = freezed,
    Object contentType = freezed,
    Object state = freezed,
    Object size = freezed,
    Object browserDownloadUrl = freezed,
  }) {
    return _then(_GitHubAsset(
      name: name == freezed ? _value.name : name as String,
      contentType:
          contentType == freezed ? _value.contentType : contentType as String,
      state: state == freezed ? _value.state : state as String,
      size: size == freezed ? _value.size : size as int,
      browserDownloadUrl: browserDownloadUrl == freezed
          ? _value.browserDownloadUrl
          : browserDownloadUrl as String,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GitHubAsset implements _GitHubAsset {
  const _$_GitHubAsset(
      {this.name,
      this.contentType,
      this.state,
      this.size,
      this.browserDownloadUrl});

  factory _$_GitHubAsset.fromJson(Map<String, dynamic> json) =>
      _$_$_GitHubAssetFromJson(json);

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

  @override
  String toString() {
    return 'GitHubAsset(name: $name, contentType: $contentType, state: $state, size: $size, browserDownloadUrl: $browserDownloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GitHubAsset &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.browserDownloadUrl, browserDownloadUrl) ||
                const DeepCollectionEquality()
                    .equals(other.browserDownloadUrl, browserDownloadUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(browserDownloadUrl);

  @override
  _$GitHubAssetCopyWith<_GitHubAsset> get copyWith =>
      __$GitHubAssetCopyWithImpl<_GitHubAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GitHubAssetToJson(this);
  }
}

abstract class _GitHubAsset implements GitHubAsset {
  const factory _GitHubAsset(
      {String name,
      String contentType,
      String state,
      int size,
      String browserDownloadUrl}) = _$_GitHubAsset;

  factory _GitHubAsset.fromJson(Map<String, dynamic> json) =
      _$_GitHubAsset.fromJson;

  @override
  String get name;
  @override
  String get contentType;
  @override
  String get state;
  @override
  int get size;
  @override
  String get browserDownloadUrl;
  @override
  _$GitHubAssetCopyWith<_GitHubAsset> get copyWith;
}

GitHubRelease _$GitHubReleaseFromJson(Map<String, dynamic> json) {
  return _GitHubRelease.fromJson(json);
}

class _$GitHubReleaseTearOff {
  const _$GitHubReleaseTearOff();

// ignore: unused_element
  _GitHubRelease call(
      {String name,
      String body,
      String tagName,
      String htmlUrl,
      BuiltList<GitHubAsset> assets}) {
    return _GitHubRelease(
      name: name,
      body: body,
      tagName: tagName,
      htmlUrl: htmlUrl,
      assets: assets,
    );
  }
}

// ignore: unused_element
const $GitHubRelease = _$GitHubReleaseTearOff();

mixin _$GitHubRelease {
  String get name;
  String get body;
  String get tagName;
  String get htmlUrl;
  BuiltList<GitHubAsset> get assets;

  Map<String, dynamic> toJson();
  $GitHubReleaseCopyWith<GitHubRelease> get copyWith;
}

abstract class $GitHubReleaseCopyWith<$Res> {
  factory $GitHubReleaseCopyWith(
          GitHubRelease value, $Res Function(GitHubRelease) then) =
      _$GitHubReleaseCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String body,
      String tagName,
      String htmlUrl,
      BuiltList<GitHubAsset> assets});
}

class _$GitHubReleaseCopyWithImpl<$Res>
    implements $GitHubReleaseCopyWith<$Res> {
  _$GitHubReleaseCopyWithImpl(this._value, this._then);

  final GitHubRelease _value;
  // ignore: unused_field
  final $Res Function(GitHubRelease) _then;

  @override
  $Res call({
    Object name = freezed,
    Object body = freezed,
    Object tagName = freezed,
    Object htmlUrl = freezed,
    Object assets = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      body: body == freezed ? _value.body : body as String,
      tagName: tagName == freezed ? _value.tagName : tagName as String,
      htmlUrl: htmlUrl == freezed ? _value.htmlUrl : htmlUrl as String,
      assets:
          assets == freezed ? _value.assets : assets as BuiltList<GitHubAsset>,
    ));
  }
}

abstract class _$GitHubReleaseCopyWith<$Res>
    implements $GitHubReleaseCopyWith<$Res> {
  factory _$GitHubReleaseCopyWith(
          _GitHubRelease value, $Res Function(_GitHubRelease) then) =
      __$GitHubReleaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String body,
      String tagName,
      String htmlUrl,
      BuiltList<GitHubAsset> assets});
}

class __$GitHubReleaseCopyWithImpl<$Res>
    extends _$GitHubReleaseCopyWithImpl<$Res>
    implements _$GitHubReleaseCopyWith<$Res> {
  __$GitHubReleaseCopyWithImpl(
      _GitHubRelease _value, $Res Function(_GitHubRelease) _then)
      : super(_value, (v) => _then(v as _GitHubRelease));

  @override
  _GitHubRelease get _value => super._value as _GitHubRelease;

  @override
  $Res call({
    Object name = freezed,
    Object body = freezed,
    Object tagName = freezed,
    Object htmlUrl = freezed,
    Object assets = freezed,
  }) {
    return _then(_GitHubRelease(
      name: name == freezed ? _value.name : name as String,
      body: body == freezed ? _value.body : body as String,
      tagName: tagName == freezed ? _value.tagName : tagName as String,
      htmlUrl: htmlUrl == freezed ? _value.htmlUrl : htmlUrl as String,
      assets:
          assets == freezed ? _value.assets : assets as BuiltList<GitHubAsset>,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GitHubRelease implements _GitHubRelease {
  const _$_GitHubRelease(
      {this.name, this.body, this.tagName, this.htmlUrl, this.assets});

  factory _$_GitHubRelease.fromJson(Map<String, dynamic> json) =>
      _$_$_GitHubReleaseFromJson(json);

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

  @override
  String toString() {
    return 'GitHubRelease(name: $name, body: $body, tagName: $tagName, htmlUrl: $htmlUrl, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GitHubRelease &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.tagName, tagName) ||
                const DeepCollectionEquality()
                    .equals(other.tagName, tagName)) &&
            (identical(other.htmlUrl, htmlUrl) ||
                const DeepCollectionEquality()
                    .equals(other.htmlUrl, htmlUrl)) &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(tagName) ^
      const DeepCollectionEquality().hash(htmlUrl) ^
      const DeepCollectionEquality().hash(assets);

  @override
  _$GitHubReleaseCopyWith<_GitHubRelease> get copyWith =>
      __$GitHubReleaseCopyWithImpl<_GitHubRelease>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GitHubReleaseToJson(this);
  }
}

abstract class _GitHubRelease implements GitHubRelease {
  const factory _GitHubRelease(
      {String name,
      String body,
      String tagName,
      String htmlUrl,
      BuiltList<GitHubAsset> assets}) = _$_GitHubRelease;

  factory _GitHubRelease.fromJson(Map<String, dynamic> json) =
      _$_GitHubRelease.fromJson;

  @override
  String get name;
  @override
  String get body;
  @override
  String get tagName;
  @override
  String get htmlUrl;
  @override
  BuiltList<GitHubAsset> get assets;
  @override
  _$GitHubReleaseCopyWith<_GitHubRelease> get copyWith;
}
