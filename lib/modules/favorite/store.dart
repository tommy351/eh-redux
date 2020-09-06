import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  _FavoriteStoreBase({
    @required this.client,
    @required this.gallery,
  })  : assert(client != null),
        assert(gallery != null);

  static const _popupPath = '/gallerypopups.php';

  final EHentaiClient client;
  final Gallery gallery;

  TextEditingController note = TextEditingController();

  Map<String, String> get _popupParams => {
        'gid': gallery.id.toString(),
        't': gallery.token,
        'act': 'addfav',
      };

  @observable
  ObservableMap<String, String> names = ObservableMap();

  @observable
  String index;

  @observable
  bool loading = false;

  @observable
  bool loaded = false;

  @observable
  bool submitting = false;

  @observable
  bool canDelete = false;

  @action
  void setIndex(String value) {
    assert(names.containsKey(value));
    index = value;
  }

  @action
  Future<void> load() async {
    if (loading) return;

    loading = true;
    canDelete = false;

    try {
      final res = await client.getHtml(_popupPath, params: _popupParams);
      final inputs = res.document.querySelectorAll('input[name="favcat"]');

      for (final element in inputs) {
        final value = element.attributes['value'];

        if (value == 'favdel') {
          canDelete = true;
        } else {
          final checked = element.attributes.containsKey('checked');
          final label = element.parent.parent.text;

          if (checked) index = value;
          names[value] = label.trim();
        }
      }

      note.text = res.document.querySelector('textarea[name="favnote"]')?.text;
      loaded = true;
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> addToFavorites() async {
    if (submitting) return;

    submitting = true;

    try {
      await _postForm({
        'update': '1',
        'favcat': index,
        'favnote': note.text,
      });
    } finally {
      submitting = false;
    }
  }

  @action
  Future<void> deleteFromFavorites() async {
    if (submitting) return;

    submitting = true;

    try {
      await _postForm({
        'update': '1',
        'favcat': 'favdel',
        'favnote': '',
      });
    } finally {
      submitting = false;
    }
  }

  Future<Response> _postForm(dynamic body) {
    return client.postForm(_popupPath, params: _popupParams, body: body);
  }
}
