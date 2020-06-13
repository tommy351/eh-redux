import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final GalleryStore galleryStore;

  _SearchStoreBase({
    @required this.galleryStore,
  }) : assert(galleryStore != null);

  @observable
  String query = '';

  @observable
  GalleryPaginationKeySearch paginationKey;

  @observable
  int categoryFilter = 0;

  // ignore: use_setters_to_change_properties
  @action
  void setQuery(String value) {
    query = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setCategoryFilter(int value) {
    categoryFilter = value;
  }

  @action
  void updatePaginationKey() {
    if (query.isEmpty) return;

    paginationKey = GalleryPaginationKeySearch(
      options: GallerySearchOptions((b) => b
        ..query = query
        ..categoryFilter = categoryFilter),
    );
  }
}
