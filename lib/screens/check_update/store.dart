import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class GitHubAsset with _$GitHubAsset {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubAsset({
    String name,
    String contentType,
    String state,
    int size,
    String browserDownloadUrl,
  }) = _GitHubAsset;

  factory GitHubAsset.fromJson(Map<String, dynamic> json) =>
      _$GitHubAssetFromJson(json);
}

@freezed
abstract class GitHubRelease with _$GitHubRelease {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubRelease({
    String name,
    String body,
    String tagName,
    String htmlUrl,
    BuiltList<GitHubAsset> assets,
  }) = _GitHubRelease;

  factory GitHubRelease.fromJson(Map<String, dynamic> json) =>
      _$GitHubReleaseFromJson(json);
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
    return GitHubRelease.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
  }
}
