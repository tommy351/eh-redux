// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GitHubAsset _$_$_GitHubAssetFromJson(Map<String, dynamic> json) {
  return _$_GitHubAsset(
    name: json['name'] as String,
    contentType: json['content_type'] as String,
    state: json['state'] as String,
    size: json['size'] as int,
    browserDownloadUrl: json['browser_download_url'] as String,
  );
}

Map<String, dynamic> _$_$_GitHubAssetToJson(_$_GitHubAsset instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content_type': instance.contentType,
      'state': instance.state,
      'size': instance.size,
      'browser_download_url': instance.browserDownloadUrl,
    };

_$_GitHubRelease _$_$_GitHubReleaseFromJson(Map<String, dynamic> json) {
  return _$_GitHubRelease(
    name: json['name'] as String,
    body: json['body'] as String,
    tagName: json['tag_name'] as String,
    htmlUrl: json['html_url'] as String,
    assets: json['assets'] != null
        ? (json['assets'] as List)
            .map((e) => e == null
                ? null
                : GitHubAsset.fromJson(e as Map<String, dynamic>))
            .toBuiltList()
        : null,
  );
}

Map<String, dynamic> _$_$_GitHubReleaseToJson(_$_GitHubRelease instance) =>
    <String, dynamic>{
      'name': instance.name,
      'body': instance.body,
      'tag_name': instance.tagName,
      'html_url': instance.htmlUrl,
      'assets': instance.assets?.map((e) => e?.toJson())?.toList(),
    };

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
