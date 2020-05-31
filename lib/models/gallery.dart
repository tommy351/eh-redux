import 'package:ehreader/utils/datetime.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Gallery extends Equatable {
  final GalleryId id;
  final String title;
  final String titleJpn;
  final String category;
  final String thumbnail;
  final String uploader;
  final int fileCount;
  final int fileSize;
  final bool expunged;
  final double rating;
  final List<String> tags;
  final DateTime posted;

  Gallery({
    @required this.id,
    this.title,
    this.titleJpn,
    this.category,
    this.thumbnail,
    this.uploader,
    this.fileCount,
    this.fileSize,
    this.expunged,
    this.rating,
    this.tags,
    this.posted,
  }) : assert(id != null);

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: GalleryId(id: json['gid'], token: json['token']),
      title: json['title'],
      titleJpn: json['title_jpn'],
      category: json['category'],
      thumbnail: json['thumb'],
      uploader: json['uploader'],
      fileCount: int.tryParse(json['filecount']) ?? 0,
      fileSize: json['filesize'],
      expunged: json['expunged'],
      rating: double.tryParse(json['rating']) ?? 0,
      tags: List<String>.from(json['tags']),
      posted: tryParseSecondsSinceEpoch(json['posted']),
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        titleJpn,
        category,
        thumbnail,
        uploader,
        fileCount,
        fileSize,
        expunged,
        rating,
        tags,
        posted,
      ];
}

@immutable
class GalleryId extends Equatable {
  final int id;
  final String token;

  GalleryId({
    @required this.id,
    @required this.token,
  })  : assert(id != null),
        assert(token != null);

  @override
  List<Object> get props => [id, token];

  @override
  String toString() => "GalleryId { id: $id, token: $token }";
}

class GalleryPaginationKey extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GalleryIdWithPage extends Equatable {
  final GalleryId galleryId;
  final int page;

  GalleryIdWithPage({
    @required this.galleryId,
    @required this.page,
  })  : assert(galleryId != null),
        assert(page != null),
        assert(page >= 0);

  @override
  List<Object> get props => [galleryId, page];
}
