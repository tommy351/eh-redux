import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/models/image.dart';
import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'image.g.dart';

class ImageStore = _ImageStoreBase with _$ImageStore;

abstract class _ImageStoreBase with Store {
  final EHentaiClient client;

  _ImageStoreBase({
    @required this.client,
  }) : assert(client != null);

  @observable
  ObservableMap<ImageId, Image> data = ObservableMap.of({});

  @observable
  ObservableMap<GalleryIdWithPage, ImageId> index = ObservableMap.of({});

  Map<GalleryIdWithPage, bool> _imageLoading = Map();
  Map<GalleryIdWithPage, Future<List<ImageId>>> _imageIdsFutures = Map();

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
    final page = GalleryIdWithPage(galleryId: galleryId, page: imagePage);
    if (index.containsKey(page) || _imageLoading.containsKey(page)) return;

    _imageLoading[page] = true;

    final imageId = await _getImageId(galleryId, imagePage);
    final image = await client.getImageData(imageId);

    add(image);
    index[page] = image.id;
    _imageLoading.remove(page);
  }

  Future<ImageId> _getImageId(GalleryId galleryId, int imagePage) async {
    final page = GalleryIdWithPage(galleryId: galleryId, page: imagePage ~/ 40);
    final future = _imageIdsFutures[page] =
        _imageIdsFutures[page] ?? client.getImageIds(page.galleryId, page.page);
    final ids = await future;

    return ids.firstWhere((element) => element.page == imagePage);
  }
}
