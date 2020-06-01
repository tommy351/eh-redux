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
      ..id = json['gid']
      ..token = json['token'];

    return Gallery((b) => b
      ..id = id
      ..title = json['title']
      ..titleJpn = json['title_jpn']
      ..category = json['category']
      ..thumbnail = json['thumb']
      ..uploader = json['uploader']
      ..fileCount = int.tryParse(json['filecount'])
      ..fileSize = json['filesize']
      ..expunged = json['expunged']
      ..rating = double.tryParse(json['rating'])
      ..tags = BuiltList<String>.from(json['tags']).toBuilder()
      ..posted = tryParseSecondsSinceEpoch(json['posted']));
  }
}

abstract class GalleryId implements Built<GalleryId, GalleryIdBuilder> {
  static Serializer<GalleryId> get serializer => _$galleryIdSerializer;

  int get id;
  String get token;

  factory GalleryId([Function(GalleryIdBuilder) updates]) = _$GalleryId;
  GalleryId._();
}

abstract class GalleryPaginationKey
    implements Built<GalleryPaginationKey, GalleryPaginationKeyBuilder> {
  static Serializer<GalleryPaginationKey> get serializer =>
      _$galleryPaginationKeySerializer;

  factory GalleryPaginationKey(
      [Function(GalleryPaginationKeyBuilder) updates]) = _$GalleryPaginationKey;
  GalleryPaginationKey._();
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
