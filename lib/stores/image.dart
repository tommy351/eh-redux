import 'dart:collection';

import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'image.g.dart';

class ImageStore = _ImageStoreBase with _$ImageStore;

abstract class _ImageStoreBase with Store {
  _ImageStoreBase({
    @required this.client,
  }) : assert(client != null);

  static const _imagePerPage = 40;

  final EHentaiClient client;

  @observable
  ObservableMap<ImageId, Image> data = ObservableMap.of({});

  @observable
  ObservableMap<GalleryIdWithPage, ImageId> index = ObservableMap.of({});

  final _imageLoading = HashSet<ImageLoadOptions>();
  final _imageIdsFutures = HashMap<GalleryIdWithPage, Future<List<ImageId>>>();

  Image getImageByPage(GalleryIdWithPage page) {
    return data[index[page]];
  }

  @action
  void add(Image image) {
    _addImage(image);
  }

  @action
  void addAll(Iterable<Image> images) {
    for (final img in images) {
      _addImage(img);
    }
  }

  void _addImage(Image image) {
    data[image.id] = image.copyWith(
      reloadKey: image.reloadKey ?? data[image.id]?.reloadKey,
    );
  }

  @action
  Future<void> loadImage(ImageLoadOptions options) async {
    if (_imageLoading.contains(options)) return;

    _imageLoading.add(options);

    try {
      final imageId = await _getImageId(options.galleryId, options.page);
      final image =
          await client.getImageData(imageId, reloadKey: options.reloadKey);

      add(image);
      index[options.galleryIdWithPage] = image.id;
    } finally {
      _imageLoading.remove(options);
    }
  }

  Future<List<ImageId>> _getImageIds(GalleryIdWithPage page) async {
    return _imageIdsFutures[page] ??=
        client.getImageIds(page.galleryId, page.page);
  }

  Future<ImageId> _getImageId(GalleryId galleryId, int imagePage) async {
    final page = GalleryIdWithPage(
      galleryId: galleryId,
      page: imagePage ~/ _imagePerPage,
    );
    final ids = await _getImageIds(page);

    return ids.firstWhere((element) => element.page == imagePage);
  }
}
