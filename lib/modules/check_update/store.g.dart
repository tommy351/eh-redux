// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckUpdateStore on _CheckUpdateStoreBase, Store {
  Computed<UpdateStatus> _$statusComputed;

  @override
  UpdateStatus get status =>
      (_$statusComputed ??= Computed<UpdateStatus>(() => super.status,
              name: '_CheckUpdateStoreBase.status'))
          .value;
  Computed<GitHubAsset> _$assetComputed;

  @override
  GitHubAsset get asset =>
      (_$assetComputed ??= Computed<GitHubAsset>(() => super.asset,
              name: '_CheckUpdateStoreBase.asset'))
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

  final _$androidDeviceInfoFutureAtom =
      Atom(name: '_CheckUpdateStoreBase.androidDeviceInfoFuture');

  @override
  ObservableFuture<AndroidDeviceInfo> get androidDeviceInfoFuture {
    _$androidDeviceInfoFutureAtom.reportRead();
    return super.androidDeviceInfoFuture;
  }

  @override
  set androidDeviceInfoFuture(ObservableFuture<AndroidDeviceInfo> value) {
    _$androidDeviceInfoFutureAtom
        .reportWrite(value, super.androidDeviceInfoFuture, () {
      super.androidDeviceInfoFuture = value;
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
androidDeviceInfoFuture: ${androidDeviceInfoFuture},
status: ${status},
asset: ${asset}
    ''';
  }
}
