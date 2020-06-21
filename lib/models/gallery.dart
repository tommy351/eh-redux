import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:eh_redux/utils/datetime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'gallery.freezed.dart';
part 'gallery.g.dart';

@freezed
abstract class Gallery implements _$Gallery {
  const factory Gallery({
    @required GalleryId id,
    @required String title,
    @required String titleJpn,
    @required String category,
    @required String thumbnail,
    @required String uploader,
    @required int fileCount,
    @required int fileSize,
    @required bool expunged,
    @required double rating,
    @required BuiltList<GalleryTag> tags,
    @required DateTime posted,
  }) = _Gallery;

  factory Gallery.fromResponse(GalleryResponse res) {
    return Gallery(
      id: GalleryId(id: res.id, token: res.token),
      title: res.title,
      titleJpn: res.titleJpn,
      category: res.category,
      thumbnail: res.thumbnail,
      uploader: res.uploader,
      fileCount: res.fileCount,
      fileSize: res.fileSize,
      expunged: res.expunged,
      rating: res.rating,
      tags: BuiltList.from(res.tags.map((e) => GalleryTag.fromString(e))),
      posted: res.posted,
    );
  }

  factory Gallery.fromEntry(GalleryEntry entry) {
    return Gallery(
      id: GalleryId(id: entry.id, token: entry.token),
      title: entry.title,
      titleJpn: entry.titleJpn,
      category: entry.category,
      thumbnail: entry.thumbnail,
      uploader: entry.uploader,
      fileCount: entry.fileCount,
      fileSize: entry.fileSize,
      expunged: entry.expunged,
      rating: entry.rating,
      tags: BuiltList.from(entry.tags.map((e) => GalleryTag.fromString(e))),
      posted: entry.posted,
    );
  }

  const Gallery._();

  GalleryEntry toEntry() {
    return GalleryEntry(
      id: id.id,
      token: id.token,
      title: title,
      titleJpn: titleJpn,
      category: category,
      thumbnail: thumbnail,
      uploader: uploader,
      fileCount: fileCount,
      fileSize: fileSize,
      expunged: expunged,
      rating: rating,
      tags: tags.map((t) => t.fullTag).toList(),
      posted: posted,
    );
  }
}

@freezed
abstract class GalleryResponse with _$GalleryResponse {
  const factory GalleryResponse({
    @JsonKey(name: 'gid') int id,
    String token,
    String title,
    @JsonKey(name: 'title_jpn') String titleJpn,
    String category,
    @JsonKey(name: 'thumb') String thumbnail,
    String uploader,
    @JsonKey(name: 'filecount', fromJson: int.tryParse) int fileCount,
    @JsonKey(name: 'filesize') int fileSize,
    bool expunged,
    @JsonKey(fromJson: double.tryParse) double rating,
    List<String> tags,
    @JsonKey(fromJson: tryParseSecondsSinceEpoch) DateTime posted,
  }) = _GalleryResponse;

  factory GalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$GalleryResponseFromJson(json);
}

@freezed
abstract class GalleryId with _$GalleryId {
  const factory GalleryId({
    @required int id,
    @required String token,
  }) = _GalleryId;
}

@freezed
abstract class GalleryTag implements _$GalleryTag {
  const factory GalleryTag({
    @Default('') String namespace,
    @required String tag,
  }) = _GalleryTag;

  factory GalleryTag.fromString(String s) {
    final index = s.indexOf(delimiter);

    if (index == -1) {
      return GalleryTag(tag: s);
    }

    return GalleryTag(
      namespace: s.substring(0, index),
      tag: s.substring(index + 1),
    );
  }

  const GalleryTag._();

  static const delimiter = ':';

  String get fullTag => namespace.isEmpty ? tag : '$namespace$delimiter$tag';

  String get shortTag => namespace.isEmpty || namespace == 'language'
      ? tag
      : '${namespace.substring(0, 1)}$delimiter$tag';
}

@freezed
abstract class GalleryPaginationKey with _$GalleryPaginationKey {
  const factory GalleryPaginationKey.frontPage() =
      GalleryPaginationKeyFrontPage;

  const factory GalleryPaginationKey.favorite() = GalleryPaginationKeyFavorite;

  const factory GalleryPaginationKey.search({
    @required String query,
    @Default(0) int categoryFilter,
    BuiltMap<String, bool> advancedOptions,
    @Default(0) int minimumRating,
  }) = GalleryPaginationKeySearch;

  const factory GalleryPaginationKey.history() = GalleryPaginationKeyHistory;
}

@freezed
abstract class GalleryIdWithPage with _$GalleryIdWithPage {
  const factory GalleryIdWithPage({
    @required GalleryId galleryId,
    @required int page,
  }) = _GalleryIdWithPage;
}

@freezed
abstract class GalleryDetails with _$GalleryDetails {
  const factory GalleryDetails({
    @required int favoritesCount,
    @required int ratingCount,
    @required int currentFavorite,
  }) = _GalleryDetails;
}

@freezed
abstract class GalleryError with _$GalleryError {
  const factory GalleryError({
    @required String message,
  }) = _GalleryError;

  const factory GalleryError.contentWarning({
    @required String reason,
  }) = GalleryErrorContentWarning;
}

@freezed
abstract class GalleryReadPosition implements _$GalleryReadPosition {
  const factory GalleryReadPosition({
    DateTime time,
    int page,
  }) = _GalleryReadPosition;

  const GalleryReadPosition._();

  factory GalleryReadPosition.fromEntry(GalleryEntry entry) {
    return GalleryReadPosition(
      page: entry.lastReadPage,
      time: entry.lastReadAt,
    );
  }
}
