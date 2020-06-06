import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ehreader/utils/datetime.dart';

part 'gallery.g.dart';

abstract class Gallery implements Built<Gallery, GalleryBuilder> {
  static Serializer<Gallery> get serializer => _$gallerySerializer;

  GalleryId get id;
  String get title;
  String get titleJpn;
  String get category;
  String get thumbnail;
  String get uploader;
  int get fileCount;
  int get fileSize;
  bool get expunged;
  double get rating;
  BuiltList<String> get tags;
  DateTime get posted;

  factory Gallery([Function(GalleryBuilder) updates]) = _$Gallery;
  Gallery._();

  factory Gallery.fromJson(Map<String, dynamic> json) {
    final id = GalleryIdBuilder()
      ..id = json['gid'] as int
      ..token = json['token'].toString();

    return Gallery((b) => b
      ..id = id
      ..title = json['title'].toString()
      ..titleJpn = json['title_jpn'].toString()
      ..category = json['category'].toString()
      ..thumbnail = json['thumb'].toString()
      ..uploader = json['uploader'].toString()
      ..fileCount = int.tryParse(json['filecount'].toString())
      ..fileSize = json['filesize'] as int
      ..expunged = json['expunged'] as bool
      ..rating = double.tryParse(json['rating'].toString())
      ..tags = BuiltList<String>.from(json['tags'] as List).toBuilder()
      ..posted = tryParseSecondsSinceEpoch(json['posted'].toString()));
  }
}

abstract class GalleryId implements Built<GalleryId, GalleryIdBuilder> {
  static Serializer<GalleryId> get serializer => _$galleryIdSerializer;

  int get id;
  String get token;

  factory GalleryId([Function(GalleryIdBuilder) updates]) = _$GalleryId;
  GalleryId._();
}

class GalleryPaginationKey {
  const GalleryPaginationKey();
}

class GalleryPaginationKeyFrontPage extends GalleryPaginationKey {
  const GalleryPaginationKeyFrontPage();
}

class GalleryPaginationKeyFavorite extends GalleryPaginationKey {
  const GalleryPaginationKeyFavorite();
}

abstract class GalleryIdWithPage
    implements Built<GalleryIdWithPage, GalleryIdWithPageBuilder> {
  static Serializer<GalleryIdWithPage> get serializer =>
      _$galleryIdWithPageSerializer;

  GalleryId get galleryId;
  int get page;

  factory GalleryIdWithPage([Function(GalleryIdWithPageBuilder) updates]) =
      _$GalleryIdWithPage;
  GalleryIdWithPage._();
}
