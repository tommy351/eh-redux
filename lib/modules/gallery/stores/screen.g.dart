// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GalleryScreenStore on _GalleryScreenStoreBase, Store {
  final _$contentWarningDisabledAtom =
      Atom(name: '_GalleryScreenStoreBase.contentWarningDisabled');

  @override
  bool get contentWarningDisabled {
    _$contentWarningDisabledAtom.reportRead();
    return super.contentWarningDisabled;
  }

  @override
  set contentWarningDisabled(bool value) {
    _$contentWarningDisabledAtom
        .reportWrite(value, super.contentWarningDisabled, () {
      super.contentWarningDisabled = value;
    });
  }

  final _$ratingCountAtom = Atom(name: '_GalleryScreenStoreBase.ratingCount');

  @override
  int? get ratingCount {
    _$ratingCountAtom.reportRead();
    return super.ratingCount;
  }

  @override
  set ratingCount(int? value) {
    _$ratingCountAtom.reportWrite(value, super.ratingCount, () {
      super.ratingCount = value;
    });
  }

  final _$loadedAtom = Atom(name: '_GalleryScreenStoreBase.loaded');

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  final _$loadingAtom = Atom(name: '_GalleryScreenStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_GalleryScreenStoreBase.error');

  @override
  GalleryError? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(GalleryError? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_GalleryScreenStoreBase.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$_GalleryScreenStoreBaseActionController =
      ActionController(name: '_GalleryScreenStoreBase');

  @override
  void disableContentWarning() {
    final _$actionInfo = _$_GalleryScreenStoreBaseActionController.startAction(
        name: '_GalleryScreenStoreBase.disableContentWarning');
    try {
      return super.disableContentWarning();
    } finally {
      _$_GalleryScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contentWarningDisabled: ${contentWarningDisabled},
ratingCount: ${ratingCount},
loaded: ${loaded},
loading: ${loading},
error: ${error}
    ''';
  }
}
