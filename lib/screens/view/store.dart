import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/tables/gallery.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class ViewStore = _ViewStoreBase with _$ViewStore;

abstract class _ViewStoreBase with Store {
  _ViewStoreBase({
    @required this.galleriesDao,
    @required this.galleryId,
  })  : assert(galleriesDao != null),
        assert(galleryId != null);

  final GalleriesDao galleriesDao;
  final GalleryId galleryId;

  @observable
  int currentPage = 0;

  @observable
  bool navVisible = false;

  @observable
  ObservableMap<GalleryIdWithPage, ImageLoadOptions> loadOptions =
      ObservableMap.of({});

  @action
  void setPage(int page) {
    currentPage = page;
    analytics.logEvent(name: 'update_view_page');
  }

  @action
  void toggleNav() {
    navVisible = !navVisible;
  }

  @action
  void updateLoadOption(ImageLoadOptions options) {
    loadOptions[options.galleryIdWithPage] = options;
  }

  @action
  Future<GalleryReadPosition> loadReadPosition() async {
    final entry = await galleriesDao.getEntry(galleryId.id);
    if (entry == null) return null;

    final pos = GalleryReadPosition.fromEntry(entry);

    if (pos.page != null) {
      currentPage = pos.page;
    }

    return pos;
  }

  @action
  Future<void> saveReadPosition() async {
    galleriesDao.updateReadPosition(
        galleryId.id,
        GalleryReadPosition(
          time: DateTime.now(),
          page: currentPage,
        ));
  }
}
