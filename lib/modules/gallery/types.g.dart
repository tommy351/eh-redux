// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GalleryResponse _$_$_GalleryResponseFromJson(Map<String, dynamic> json) {
  return _$_GalleryResponse(
    id: json['gid'] as int,
    token: json['token'] as String,
    title: json['title'] as String,
    titleJpn: json['title_jpn'] as String,
    category: json['category'] as String? ?? '',
    thumbnail: json['thumb'] as String,
    uploader: json['uploader'] as String? ?? '',
    fileCount: int.tryParse(json['filecount'] as String),
    fileSize: json['filesize'] as int,
    expunged: json['expunged'] as bool? ?? false,
    rating: double.tryParse(json['rating'] as String),
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    posted: tryParseSecondsSinceEpoch(json['posted'] as String),
  );
}

Map<String, dynamic> _$_$_GalleryResponseToJson(_$_GalleryResponse instance) =>
    <String, dynamic>{
      'gid': instance.id,
      'token': instance.token,
      'title': instance.title,
      'title_jpn': instance.titleJpn,
      'category': instance.category,
      'thumb': instance.thumbnail,
      'uploader': instance.uploader,
      'filecount': instance.fileCount,
      'filesize': instance.fileSize,
      'expunged': instance.expunged,
      'rating': instance.rating,
      'tags': instance.tags,
      'posted': instance.posted?.toIso8601String(),
    };
