import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
class GitHubAsset with _$GitHubAsset {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubAsset({
    @Default('') String name,
    @Default('') String contentType,
    @Default('') String state,
    @Default(0) int size,
    @Default('') String browserDownloadUrl,
  }) = _GitHubAsset;

  factory GitHubAsset.fromJson(Map<String, dynamic> json) =>
      _$GitHubAssetFromJson(json);
}

@freezed
class GitHubRelease with _$GitHubRelease {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubRelease({
    @Default('') String name,
    @Default('') String body,
    @Default('') String tagName,
    @Default('') String htmlUrl,
    BuiltList<GitHubAsset>? assets,
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
