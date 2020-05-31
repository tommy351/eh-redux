// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImageStore on _ImageStoreBase, Store {
  final _$dataAtom = Atom(name: '_ImageStoreBase.data');

  @override
  ObservableMap<ImageId, Image> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableMap<ImageId, Image> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$indexAtom = Atom(name: '_ImageStoreBase.index');

  @override
  ObservableMap<GalleryIdWithPage, ImageId> get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(ObservableMap<GalleryIdWithPage, ImageId> value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$loadImageAsyncAction = AsyncAction('_ImageStoreBase.loadImage');

  @override
  Future<void> loadImage(GalleryId galleryId, int imagePage) {
    return _$loadImageAsyncAction
        .run(() => super.loadImage(galleryId, imagePage));
  }

  final _$_ImageStoreBaseActionController =
      ActionController(name: '_ImageStoreBase');

  @override
  void add(Image image) {
    final _$actionInfo = _$_ImageStoreBaseActionController.startAction(
        name: '_ImageStoreBase.add');
    try {
      return super.add(image);
    } finally {
      _$_ImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<Image> images) {
    final _$actionInfo = _$_ImageStoreBaseActionController.startAction(
        name: '_ImageStoreBase.addAll');
    try {
      return super.addAll(images);
    } finally {
      _$_ImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
index: ${index}
    ''';
  }
}
