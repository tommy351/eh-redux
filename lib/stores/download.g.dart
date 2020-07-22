// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DownloadStore on _DownloadStoreBase, Store {
  final _$dataAtom = Atom(name: '_DownloadStoreBase.data');

  @override
  ObservableMap<int, DownloadTask> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableMap<int, DownloadTask> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$loadOneAsyncAction = AsyncAction('_DownloadStoreBase.loadOne');

  @override
  Future<void> loadOne(int galleryId) {
    return _$loadOneAsyncAction.run(() => super.loadOne(galleryId));
  }

  final _$startAsyncAction = AsyncAction('_DownloadStoreBase.start');

  @override
  Future<void> start(DownloadTask task) {
    return _$startAsyncAction.run(() => super.start(task));
  }

  final _$pauseAsyncAction = AsyncAction('_DownloadStoreBase.pause');

  @override
  Future<void> pause(DownloadTask task) {
    return _$pauseAsyncAction.run(() => super.pause(task));
  }

  final _$_DownloadStoreBaseActionController =
      ActionController(name: '_DownloadStoreBase');

  @override
  void _setTasks(Iterable<DownloadTask> tasks) {
    final _$actionInfo = _$_DownloadStoreBaseActionController.startAction(
        name: '_DownloadStoreBase._setTasks');
    try {
      return super._setTasks(tasks);
    } finally {
      _$_DownloadStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
