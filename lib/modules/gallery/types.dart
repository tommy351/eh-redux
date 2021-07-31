import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/utils/datetime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html_unescape/html_unescape_small.dart';

part 'types.freezed.dart';
part 'types.g.dart';

final _htmlUnescape = HtmlUnescape();
final zeroDateTime = DateTime.fromMillisecondsSinceEpoch(0);

@freezed
class GalleryId with _$GalleryId {
  const factory GalleryId({
    required int id,
    required String token,
  }) = _GalleryId;

  const GalleryId._();

  String get path => '/g/$id/$token';
}

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    required int id,
    required String token,
    required String title,
    required String titleJpn,
    required String category,
    required String thumbnail,
    required String uploader,
    required int fileCount,
    required int fileSize,
    required bool expunged,
    required double rating,
    required BuiltList<GalleryTag> tags,
    required DateTime posted,
  }) = _Gallery;

  factory Gallery.fromResponse(GalleryResponse res) {
    return Gallery(
      id: res.id,
      token: res.token,
      title: _htmlUnescape.convert(res.title),
      titleJpn: _htmlUnescape.convert(res.titleJpn),
      category: res.category,
      thumbnail: res.thumbnail,
      uploader: res.uploader,
      fileCount: res.fileCount ?? 0,
      fileSize: res.fileSize,
      expunged: res.expunged,
      rating: res.rating ?? 0,
      tags: BuiltList.from(res.tags.map((e) => GalleryTag.fromString(e))),
      posted: res.posted ?? zeroDateTime,
    );
  }

  factory Gallery.fromEntry(GalleryEntry entry) {
    return Gallery(
      id: entry.id,
      token: entry.token,
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

  GalleryId get galleryId => GalleryId(id: id, token: token);

  GalleryEntry toEntry() {
    return GalleryEntry(
      id: id,
      token: token,
      title: title,
      titleJpn: titleJpn,
      category: category,
      thumbnail: thumbnail,
      uploader: uploader,
      fileCount: fileCount,
      fileSize: fileSize,
      expunged: expunged,
      rating: rating,
      tags: tags.map((e) => e.fullTag).toList(),
      posted: posted,
    );
  }
}

@freezed
class GalleryTag with _$GalleryTag {
  const factory GalleryTag({
    @Default('') String namespace,
    required String tag,
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
class GalleryResponse with _$GalleryResponse {
  const factory GalleryResponse({
    @JsonKey(name: 'gid') required int id,
    required String token,
    required String title,
    @JsonKey(name: 'title_jpn') @Default('') String titleJpn,
    @Default('') String category,
    @JsonKey(name: 'thumb') @Default('') String thumbnail,
    @Default('') String uploader,
    @JsonKey(name: 'filecount', fromJson: int.tryParse) int? fileCount,
    @JsonKey(name: 'filesize') @Default(0) int fileSize,
    @Default(false) bool expunged,
    @JsonKey(fromJson: double.tryParse) double? rating,
    @Default([]) List<String> tags,
    @JsonKey(fromJson: tryParseSecondsSinceEpoch) DateTime? posted,
  }) = _GalleryResponse;

  factory GalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$GalleryResponseFromJson(json);
}

@freezed
class GalleryReadPosition with _$GalleryReadPosition {
  const factory GalleryReadPosition({
    required int page,
    required DateTime time,
  }) = _GalleryReadPosition;
}
