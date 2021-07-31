import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:device_info/device_info.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';

import 'types.dart';

part 'store.g.dart';

class CheckUpdateStore = _CheckUpdateStoreBase with _$CheckUpdateStore;

abstract class _CheckUpdateStoreBase with Store {
  final _deviceInfo = DeviceInfoPlugin();

  @observable
  ObservableFuture<GitHubRelease>? releaseFuture;

  @observable
  ObservableFuture<PackageInfo>? packageInfoFuture;

  @observable
  ObservableFuture<AndroidDeviceInfo>? androidDeviceInfoFuture;

  @computed
  UpdateStatus get status {
    final futures = <ObservableFuture?>[
      releaseFuture,
      packageInfoFuture,
      androidDeviceInfoFuture,
    ];

    if (futures.any((x) => x?.status == FutureStatus.rejected)) {
      return UpdateStatus.failed;
    }

    if (futures.any((x) => x?.status == FutureStatus.pending)) {
      return UpdateStatus.pending;
    }

    if (trimPrefix(releaseFuture?.value?.tagName ?? '', 'v') !=
        packageInfoFuture?.value?.version) {
      return UpdateStatus.canUpdate;
    }

    return UpdateStatus.noUpdate;
  }

  @computed
  GitHubAsset? get asset {
    final release = releaseFuture?.value;
    final info = androidDeviceInfoFuture?.value;

    if (release == null || info == null) return null;

    final assets = release.assets?.where((asset) =>
        asset.contentType == 'application/vnd.android.package-archive' &&
        asset.state == 'uploaded');

    if (assets == null) return null;

    for (final abi in info.supportedAbis) {
      final asset =
          assets.where((asset) => asset.name.contains(abi)).firstOrNull;
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
    final res = await http.get(Uri.parse(
        'https://api.github.com/repos/tommy351/eh-redux/releases/latest'));
    return GitHubRelease.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
  }
}
