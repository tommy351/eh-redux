import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eh_redux/utils/datetime.dart';
import 'package:meta/meta.dart';

part 'gallery.g.dart';

abstract class Gallery implements Built<Gallery, GalleryBuilder> {
  factory Gallery([Function(GalleryBuilder) updates]) = _$Gallery;
  Gallery._();

  factory Gallery.fromJson(Map<String, dynamic> json) {
    final id = GalleryIdBuilder()
      ..id = json['gid'] as int
      ..token = json['token'].toString();
    final tags =
        (json['tags'] as List).map((e) => GalleryTag.fromString(e as String));

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
      ..tags = BuiltList<GalleryTag>.from(tags).toBuilder()
      ..posted = tryParseSecondsSinceEpoch(json['posted'].toString()));
  }

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
  BuiltList<GalleryTag> get tags;
  DateTime get posted;
}

abstract class GalleryId implements Built<GalleryId, GalleryIdBuilder> {
  factory GalleryId([Function(GalleryIdBuilder) updates]) = _$GalleryId;
  GalleryId._();

  static Serializer<GalleryId> get serializer => _$galleryIdSerializer;

  int get id;
  String get token;
}

abstract class GalleryTag implements Built<GalleryTag, GalleryTagBuilder> {
  factory GalleryTag([Function(GalleryTagBuilder) updates]) = _$GalleryTag;
  GalleryTag._();

  factory GalleryTag.fromString(String s) {
    final parts = s.split(delimiter);

    if (parts.length < 2) {
      return GalleryTag((b) => b
        ..namespace = ''
        ..tag = parts[0]);
    }

    return GalleryTag((b) => b
      ..namespace = parts[0]
      ..tag = parts.sublist(1).join(delimiter));
  }

  static const delimiter = ':';

  static Serializer<GalleryTag> get serializer => _$galleryTagSerializer;

  String get namespace;
  String get tag;

  String fullTag() => namespace.isEmpty ? tag : '$namespace$delimiter$tag';

  String shortTag() => namespace.isEmpty || namespace == 'language'
      ? tag
      : '${namespace.substring(0, 1)}$delimiter$tag';
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

class GalleryPaginationKeySearch extends GalleryPaginationKey {
  GalleryPaginationKeySearch({
    @required this.options,
  }) : assert(options != null);

  final GallerySearchOptions options;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryPaginationKeySearch &&
          runtimeType == other.runtimeType &&
          options == other.options;

  @override
  int get hashCode => options.hashCode;

  @override
  String toString() {
    return 'GalleryPaginationKeySearch{options: $options}';
  }
}

abstract class GallerySearchOptions
    implements Built<GallerySearchOptions, GallerySearchOptionsBuilder> {
  factory GallerySearchOptions(
      [Function(GallerySearchOptionsBuilder) updates]) = _$GallerySearchOptions;
  GallerySearchOptions._();

  static Serializer<GallerySearchOptions> get serializer =>
      _$gallerySearchOptionsSerializer;

  String get query;
  int get categoryFilter;
  BuiltMap<String, bool> get advancedOptions;
  int get minimumRating;
}

abstract class GalleryIdWithPage
    implements Built<GalleryIdWithPage, GalleryIdWithPageBuilder> {
  factory GalleryIdWithPage([Function(GalleryIdWithPageBuilder) updates]) =
      _$GalleryIdWithPage;
  GalleryIdWithPage._();

  static Serializer<GalleryIdWithPage> get serializer =>
      _$galleryIdWithPageSerializer;

  GalleryId get galleryId;
  int get page;
}

abstract class GalleryDetails
    implements Built<GalleryDetails, GalleryDetailsBuilder> {
  factory GalleryDetails([void Function(GalleryDetailsBuilder) updates]) =
      _$GalleryDetails;
  GalleryDetails._();

  static Serializer<GalleryDetails> get serializer =>
      _$galleryDetailsSerializer;

  int get favoritesCount;
  int get ratingCount;
  int get currentFavorite;
}
