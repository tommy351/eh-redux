// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GitHubAsset _$_$_GitHubAssetFromJson(Map<String, dynamic> json) {
  return _$_GitHubAsset(
    name: json['name'] as String,
    contentType: json['content_type'] as String,
    state: json['state'] as String,
    size: json['size'] as int,
    browserDownloadUrl: json['browser_download_url'] as String,
  );
}

Map<String, dynamic> _$_$_GitHubAssetToJson(_$_GitHubAsset instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content_type': instance.contentType,
      'state': instance.state,
      'size': instance.size,
      'browser_download_url': instance.browserDownloadUrl,
    };

_$_GitHubRelease _$_$_GitHubReleaseFromJson(Map<String, dynamic> json) {
  return _$_GitHubRelease(
    name: json['name'] as String,
    body: json['body'] as String,
    tagName: json['tag_name'] as String,
    htmlUrl: json['html_url'] as String,
    assets: json['assets'] != null
        ? (json['assets'] as List)
            .map((e) => e == null
                ? null
                : GitHubAsset.fromJson(e as Map<String, dynamic>))
            .toBuiltList()
        : null,
  );
}

Map<String, dynamic> _$_$_GitHubReleaseToJson(_$_GitHubRelease instance) =>
    <String, dynamic>{
      'name': instance.name,
      'body': instance.body,
      'tag_name': instance.tagName,
      'html_url': instance.htmlUrl,
      'assets': instance.assets?.map((e) => e?.toJson())?.toList(),
    };
