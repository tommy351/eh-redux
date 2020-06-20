import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
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

  final Map<GalleryIdWithPage, bool> _imageLoading = {};
  final Map<GalleryIdWithPage, Future<List<ImageId>>> _imageIdsFutures = {};

  @action
  void add(Image image) {
    data[image.id] = image;
  }

  @action
  void addAll(Iterable<Image> images) {
    data.addEntries(images.map((e) => MapEntry(e.id, e)));
  }

  @action
  Future<void> loadImage(GalleryId galleryId, int imagePage) async {
    final page = GalleryIdWithPage(
      galleryId: galleryId,
      page: imagePage,
    );

    if (index.containsKey(page) || _imageLoading.containsKey(page)) return;

    _imageLoading[page] = true;

    try {
      final imageId = await _getImageId(galleryId, imagePage);
      final image = await client.getImageData(imageId);

      add(image);
      index[page] = image.id;
    } finally {
      _imageLoading.remove(page);
    }
  }

  Future<List<ImageId>> _getImageIds(GalleryIdWithPage page) async {
    final future = _imageIdsFutures[page];

    if (future != null) {
      try {
        return await future;
      } catch (_) {}
    }

    return client.getImageIds(page.galleryId, page.page);
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
