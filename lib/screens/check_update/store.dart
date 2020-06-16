import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';

part 'store.g.dart';

@SerializersFor([
  GitHubRelease,
  GitHubAsset,
])
final Serializers _serializers = (_$_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

abstract class GitHubAsset implements Built<GitHubAsset, GitHubAssetBuilder> {
  factory GitHubAsset([void Function(GitHubAssetBuilder) updates]) =
      _$GitHubAsset;

  factory GitHubAsset.fromJson(String jsonString) =>
      _serializers.deserializeWith(serializer, jsonDecode(jsonString));

  GitHubAsset._();

  static Serializer<GitHubAsset> get serializer => _$gitHubAssetSerializer;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'content_type')
  String get contentType;

  @BuiltValueField(wireName: 'state')
  String get state;

  @BuiltValueField(wireName: 'size')
  int get size;

  @BuiltValueField(wireName: 'browser_download_url')
  String get browserDownloadUrl;
}

abstract class GitHubRelease
    implements Built<GitHubRelease, GitHubReleaseBuilder> {
  factory GitHubRelease([void Function(GitHubReleaseBuilder) updates]) =
      _$GitHubRelease;

  factory GitHubRelease.fromJson(String jsonString) =>
      _serializers.deserializeWith(serializer, jsonDecode(jsonString));

  GitHubRelease._();

  static Serializer<GitHubRelease> get serializer => _$gitHubReleaseSerializer;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'body')
  String get body;

  @BuiltValueField(wireName: 'tag_name')
  String get tagName;

  @BuiltValueField(wireName: 'html_url')
  String get htmlUrl;

  @BuiltValueField(wireName: 'assets')
  BuiltList<GitHubAsset> get assets;
}

enum UpdateStatus {
  pending,
  failed,
  canUpdate,
  noUpdate,
}

class CheckUpdateStore = _CheckUpdateStoreBase with _$CheckUpdateStore;

abstract class _CheckUpdateStoreBase with Store {
  @observable
  ObservableFuture<GitHubRelease> releaseFuture;

  @observable
  ObservableFuture<PackageInfo> packageInfoFuture;

  @computed
  UpdateStatus get status {
    if (releaseFuture.status == FutureStatus.pending ||
        packageInfoFuture.status == FutureStatus.pending) {
      return UpdateStatus.pending;
    }

    if (releaseFuture.status == FutureStatus.rejected ||
        packageInfoFuture.status == FutureStatus.rejected) {
      return UpdateStatus.failed;
    }

    if (trimPrefix(releaseFuture.value.tagName, 'v') !=
        packageInfoFuture.value.version) {
      return UpdateStatus.canUpdate;
    }

    return UpdateStatus.noUpdate;
  }

  @action
  void check() {
    releaseFuture = ObservableFuture(_fetchLatestRelease());
    packageInfoFuture = ObservableFuture(PackageInfo.fromPlatform());
  }

  Future<GitHubRelease> _fetchLatestRelease() async {
    final res = await http
        .get('https://api.github.com/repos/tommy351/eh-redux/releases/latest');
    return GitHubRelease.fromJson(res.body);
  }
}
