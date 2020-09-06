import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'network_list.g.dart';

Iterable<MapEntry<int, Gallery>> _toMapEntries(Iterable<Gallery> data) {
  return data.map((e) => MapEntry(e.id, e));
}

class NetworkGalleryListStore = _NetworkGalleryListStoreBase
    with _$NetworkGalleryListStore;

abstract class _NetworkGalleryListStoreBase with Store {
  _NetworkGalleryListStoreBase({
    @required this.client,
    this.path = '/',
    this.params,
  }) : assert(client != null);

  final EHentaiClient client;
  final String path;
  final Map<String, String> params;

  @observable
  ObservableMap<int, Gallery> data = ObservableMap();

  @observable
  int currentPage = -1;

  @observable
  bool loading = false;

  @observable
  bool hasMore = true;

  @action
  Future<void> loadInitialPage() async {
    if (currentPage < 0) {
      await loadNextPage();
    }
  }

  @action
  Future<void> loadNextPage() async {
    final galleries = await _loadPage(currentPage + 1);
    data.addEntries(_toMapEntries(galleries));
  }

  @action
  Future<void> refreshPage() async {
    final galleries = await _loadPage(0);
    data.clear();
    data.addEntries(_toMapEntries(galleries));
  }

  Future<List<Gallery>> _loadPage(int page) async {
    if (loading) return [];

    loading = true;

    try {
      final ids = await _getIds(page);
      final galleries = await _getGalleries(ids);
      currentPage = page;
      hasMore = galleries.length >= 25;

      return galleries;
    } finally {
      loading = false;
    }
  }

  Future<List<GalleryId>> _getIds(int page) async {
    final res = await client.getHtml(path, params: {
      ...params ?? {},
      'page': page.toString(),
    });
    final ids = <GalleryId>[];

    for (final element in res.document.querySelectorAll('.glname > a')) {
      final href = element.attributes['href'];
      if (href == null || href.isEmpty) continue;

      final uri = Uri.tryParse(href);
      if (uri == null) continue;

      final segments = uri.pathSegments;
      if (segments[0] != 'g') continue;

      final id = int.tryParse(segments[1]);
      final token = segments[2];
      if (id == null || token == null) continue;

      ids.add(GalleryId(id: id, token: token));
    }

    return ids;
  }

  Future<List<Gallery>> _getGalleries(List<GalleryId> ids) async {
    final res = await client.requestApi({
      'method': 'gdata',
      'gidlist': ids.map((e) => [e.id, e.token]).toList(),
      'namespace': '1',
    });
    final data = res.data as Map;
    final galleries = <Gallery>[];

    for (final json in data['gmetadata'] ?? []) {
      final value = json as Map<String, dynamic>;

      if (!value.containsKey('error')) {
        final galleryRes = GalleryResponse.fromJson(value);
        galleries.add(Gallery.fromResponse(galleryRes));
      }
    }

    return galleries;
  }
}
