import 'dart:io';

import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/dom.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:share/share.dart';

part 'screen.freezed.dart';
part 'screen.g.dart';

@freezed
class GalleryError with _$GalleryError {
  const factory GalleryError({
    required String message,
  }) = _GalleryError;

  const factory GalleryError.contentWarning({
    required String reason,
  }) = GalleryErrorContentWarning;

  const factory GalleryError.notFound() = GalleryErrorNotFound;
}

class GalleryScreenStore = _GalleryScreenStoreBase with _$GalleryScreenStore;

abstract class _GalleryScreenStoreBase with Store {
  _GalleryScreenStoreBase({
    required this.client,
    required this.gallery,
  });

  final EHentaiClient client;
  final Gallery gallery;

  GalleryId get galleryId => gallery.galleryId;

  Uri getUri({Map<String, String>? params}) {
    return client.getUri(galleryId.path, params: params);
  }

  @observable
  bool contentWarningDisabled = false;

  @observable
  int? ratingCount;

  @observable
  bool loaded = false;

  @observable
  bool loading = false;

  @observable
  GalleryError? error;

  @action
  void disableContentWarning() {
    contentWarningDisabled = true;
  }

  @action
  Future<void> load() async {
    if (loaded || loading) return;

    loading = true;
    error = null;

    try {
      await _doLoad();
      loaded = true;
    } on GalleryError catch (err) {
      error = err;
    } on RequestException catch (err) {
      error = GalleryError(message: err.message);
    } on SocketException catch (_) {
      // When network is disconnected
      loaded = true;
    } catch (err, stackTrace) {
      FirebaseCrashlytics.instance.recordError(err, stackTrace);
      error = GalleryError(message: err.toString());
    } finally {
      loading = false;
    }
  }

  Future<void> _doLoad() async {
    final res = await client.getHtml(
      galleryId.path,
      disableContentWarning: contentWarningDisabled,
    );

    // Try to get the header
    if (res.document.getElementById('nb') == null) {
      throw const GalleryError.notFound();
    }

    // Test if the content is flagged
    final contentWarning = res.document
        .querySelectorAll('h1')
        .where((element) => element.innerHtml == 'Content Warning')
        .firstOrNull;

    if (contentWarning != null) {
      throw GalleryError.contentWarning(
          reason: contentWarning.nextElementSibling
                  ?.querySelector('strong')
                  ?.innerHtml ??
              contentWarning.innerHtml);
    }

    ratingCount = _getRatingCount(res.document);
  }

  int? _getRatingCount(Document document) {
    final element = document.getElementById('rating_count');
    if (element == null) return null;
    return int.tryParse(element.text);
  }

  void share() {
    Share.share(
      getUri().toString(),
      subject: gallery.title,
    );
  }
}
