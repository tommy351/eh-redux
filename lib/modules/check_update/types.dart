import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
abstract class GitHubAsset with _$GitHubAsset {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubAsset({
    String name,
    String contentType,
    String state,
    int size,
    String browserDownloadUrl,
  }) = _GitHubAsset;

  factory GitHubAsset.fromJson(Map<String, dynamic> json) =>
      _$GitHubAssetFromJson(json);
}

@freezed
abstract class GitHubRelease with _$GitHubRelease {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubRelease({
    String name,
    String body,
    String tagName,
    String htmlUrl,
    BuiltList<GitHubAsset> assets,
  }) = _GitHubRelease;

  factory GitHubRelease.fromJson(Map<String, dynamic> json) =>
      _$GitHubReleaseFromJson(json);
}

enum UpdateStatus {
  pending,
  failed,
  canUpdate,
  noUpdate,
}
