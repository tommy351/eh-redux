import 'package:eh_redux/modules/download/daos/image.dart';
import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/image/types.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:eh_redux/utils/css.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/dom.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:share/share.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class ImageError with _$ImageError {
  const factory ImageError.notFound() = ImageErrorNotFound;
}

class ImageStore = _ImageStoreBase with _$ImageStore;

abstract class _ImageStoreBase with Store {
  _ImageStoreBase({
    @required this.client,
    @required this.gallery,
    @required this.galleriesDao,
    @required this.downloadedImagesDao,
  })  : assert(client != null),
        assert(gallery != null),
        assert(galleriesDao != null),
        assert(downloadedImagesDao != null);

  static final _reloadKeyRegExp = RegExp(r"nl\('([^']+)'\)");

  final EHentaiClient client;
  final Gallery gallery;
  final GalleriesDao galleriesDao;
  final DownloadedImagesDao downloadedImagesDao;

  final _imageIds = <int, Future<List<ImageId>>>{};
  int _imagePerPage;

  GalleryId get galleryId => gallery.galleryId;
  int get totalPage => gallery.fileCount;

  @observable
  int currentPage = 0;

  @observable
  bool readPositionLoaded = false;

  @observable
  ObservableMap<int, GalleryImage> data = ObservableMap();

  @observable
  ObservableSet<int> loading = ObservableSet();

  @observable
  bool navVisible = false;

  @computed
  int get currentPage1 => currentPage + 1;

  @computed
  GalleryImage get currentImage => data[currentPage1];

  @action
  void toggleNav() {
    navVisible = !navVisible;
  }

  @action
  void setCurrentPage(int page) {
    assert(page >= 0 && page < totalPage);
    currentPage = page;
    analytics.logEvent(name: 'update_view_page');
  }

  @action
  Future<void> loadReadPosition() async {
    if (readPositionLoaded) return;

    await galleriesDao.upsertEntry(gallery.toEntry());

    final pos = await galleriesDao.getReadPosition(gallery.id);

    if (pos != null) {
      currentPage = pos.page;
    }

    readPositionLoaded = true;
  }

  Future<void> saveReadPosition() async {
    await galleriesDao.updateReadPosition(gallery.id, currentPage);
  }

  @action
  Future<void> loadPage(
    int page, {
    String reloadKey,
    bool networkOnly = false,
  }) async {
    if (loading.contains(page)) return;

    loading.add(page);

    try {
      if (!networkOnly) {
        final local = await loadLocalPage(page);

        if (local != null) {
          data[page] = local;
          return;
        }
      }

      data[page] = await loadNetworkPage(page, reloadKey: reloadKey);
    } finally {
      loading.remove(page);
    }
  }

  Future<LocalGalleryImage> loadLocalPage(int page) async {
    final entry = await downloadedImagesDao.getEntry(gallery.id, page);
    if (entry == null) return null;

    return LocalGalleryImage(
      id: ImageId(
        galleryId: galleryId,
        page: entry.page,
        key: entry.key,
      ),
      width: entry.width,
      height: entry.height,
      path: entry.path,
    );
  }

  Future<NetworkGalleryImage> loadNetworkPage(int page,
      {String reloadKey}) async {
    final id = await _getImageId(page);
    final params = <String, String>{};

    if (reloadKey != null && reloadKey.isNotEmpty) {
      params['nl'] = reloadKey;
    }

    final res = await client.getHtml(
      id.path,
      params: params,
      disableContentWarning: true,
    );

    final img = res.document.getElementById('img');

    if (img == null) {
      throw const ImageError.notFound();
    }

    final src = img.attributes['src'];
    final style = parseRules(img.attributes['style']);

    return NetworkGalleryImage(
      id: id,
      url: src,
      width: _parseCssPixelSize(style['width']),
      height: _parseCssPixelSize(style['height']),
      reloadKey: _getReloadKey(img),
    );
  }

  Future<List<ImageId>> _getImageIds(int galleryPage) async {
    final res = await client.getHtml(
      galleryId.path,
      params: {
        'p': galleryPage.toString(),
      },
      disableContentWarning: true,
    );

    final ids = <ImageId>[];

    for (final element in res.document.querySelectorAll('#gdt a')) {
      final href = element.attributes['href'];
      if (href == null || href.isEmpty) continue;

      final uri = Uri.tryParse(href);
      if (uri == null) continue;

      final segments = uri.pathSegments;
      if (segments[0] != 's') continue;

      final key = segments[1];
      final parts = segments[2].split('-');

      if (parts.length != 2) continue;

      final gid = int.tryParse(parts[0]);
      final page = int.tryParse(parts[1]);
      if (gid == null || page == null || gid != galleryId.id) continue;

      ids.add(ImageId(
        galleryId: galleryId,
        page: page,
        key: key,
      ));
    }

    return ids;
  }

  Future<ImageId> _getImageId(int imagePage) async {
    final galleryPage = _imagePerPage == null ? 0 : imagePage ~/ _imagePerPage;
    final ids = await (_imageIds[galleryPage] ??= _getImageIds(galleryPage));

    _imagePerPage ??= ids.length;

    return ids.firstWhere((e) => e.page == imagePage);
  }

  int _parseCssPixelSize(String s) {
    if (s == null || s.isEmpty) return null;
    return int.tryParse(trimSuffix(s, 'px'));
  }

  String _getReloadKey(Element img) {
    final attr = img.attributes['onerror'];
    if (attr == null || attr.isEmpty) return null;
    return _reloadKeyRegExp.firstMatch(attr).group(1);
  }

  Uri getUri(GalleryImage image, {Map<String, String> params}) {
    return client.getUri(image.id.path);
  }

  void share(GalleryImage image) {
    Share.share(
      getUri(image).toString(),
      subject: gallery.title,
    );
  }
}
