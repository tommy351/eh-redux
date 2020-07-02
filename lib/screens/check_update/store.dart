import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:device_info/device_info.dart';
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
  final _deviceInfo = DeviceInfoPlugin();

  @observable
  ObservableFuture<GitHubRelease> releaseFuture;

  @observable
  ObservableFuture<PackageInfo> packageInfoFuture;

  @observable
  ObservableFuture<AndroidDeviceInfo> androidDeviceInfoFuture;

  @computed
  UpdateStatus get status {
    final futures = <ObservableFuture>[
      releaseFuture,
      packageInfoFuture,
      androidDeviceInfoFuture,
    ];

    if (futures.any((x) => x.status == FutureStatus.rejected)) {
      return UpdateStatus.failed;
    }

    if (futures.any((x) => x.status == FutureStatus.pending)) {
      return UpdateStatus.pending;
    }

    if (trimPrefix(releaseFuture.value.tagName, 'v') !=
        packageInfoFuture.value.version) {
      return UpdateStatus.canUpdate;
    }

    return UpdateStatus.noUpdate;
  }

  @computed
  GitHubAsset get asset {
    final release = releaseFuture.value;
    final info = androidDeviceInfoFuture.value;

    if (release == null || info == null) return null;

    final assets = release.assets.where((asset) =>
        asset.contentType == 'application/vnd.android.package-archive' &&
        asset.state == 'uploaded');

    for (final abi in info.supportedAbis) {
      final asset = assets.firstWhere((asset) => asset.name.contains(abi),
          orElse: () => null);
      if (asset != null) return asset;
    }

    return null;
  }

  @action
  void check() {
    releaseFuture = ObservableFuture(_fetchLatestRelease());
    packageInfoFuture = ObservableFuture(PackageInfo.fromPlatform());
    androidDeviceInfoFuture = ObservableFuture(_deviceInfo.androidInfo);
  }

  Future<GitHubRelease> _fetchLatestRelease() async {
    final res = await http
        .get('https://api.github.com/repos/tommy351/eh-redux/releases/latest');
    return GitHubRelease.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
  }
}
