// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DownloadTaskTearOff {
  const _$DownloadTaskTearOff();

// ignore: unused_element
  _DownloadTask call(
      {@required int galleryId,
      @required int totalCount,
      int downloadedCount = 0,
      @required DateTime createdAt,
      @required DateTime queuedAt,
      DownloadTaskState state = DownloadTaskState.pending,
      String errorDetails}) {
    return _DownloadTask(
      galleryId: galleryId,
      totalCount: totalCount,
      downloadedCount: downloadedCount,
      createdAt: createdAt,
      queuedAt: queuedAt,
      state: state,
      errorDetails: errorDetails,
    );
  }
}

// ignore: unused_element
const $DownloadTask = _$DownloadTaskTearOff();

mixin _$DownloadTask {
  int get galleryId;
  int get totalCount;
  int get downloadedCount;
  DateTime get createdAt;
  DateTime get queuedAt;
  DownloadTaskState get state;
  String get errorDetails;

  $DownloadTaskCopyWith<DownloadTask> get copyWith;
}

abstract class $DownloadTaskCopyWith<$Res> {
  factory $DownloadTaskCopyWith(
          DownloadTask value, $Res Function(DownloadTask) then) =
      _$DownloadTaskCopyWithImpl<$Res>;
  $Res call(
      {int galleryId,
      int totalCount,
      int downloadedCount,
      DateTime createdAt,
      DateTime queuedAt,
      DownloadTaskState state,
      String errorDetails});
}

class _$DownloadTaskCopyWithImpl<$Res> implements $DownloadTaskCopyWith<$Res> {
  _$DownloadTaskCopyWithImpl(this._value, this._then);

  final DownloadTask _value;
  // ignore: unused_field
  final $Res Function(DownloadTask) _then;

  @override
  $Res call({
    Object galleryId = freezed,
    Object totalCount = freezed,
    Object downloadedCount = freezed,
    Object createdAt = freezed,
    Object queuedAt = freezed,
    Object state = freezed,
    Object errorDetails = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId: galleryId == freezed ? _value.galleryId : galleryId as int,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      downloadedCount: downloadedCount == freezed
          ? _value.downloadedCount
          : downloadedCount as int,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      queuedAt: queuedAt == freezed ? _value.queuedAt : queuedAt as DateTime,
      state: state == freezed ? _value.state : state as DownloadTaskState,
      errorDetails: errorDetails == freezed
          ? _value.errorDetails
          : errorDetails as String,
    ));
  }
}

abstract class _$DownloadTaskCopyWith<$Res>
    implements $DownloadTaskCopyWith<$Res> {
  factory _$DownloadTaskCopyWith(
          _DownloadTask value, $Res Function(_DownloadTask) then) =
      __$DownloadTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {int galleryId,
      int totalCount,
      int downloadedCount,
      DateTime createdAt,
      DateTime queuedAt,
      DownloadTaskState state,
      String errorDetails});
}

class __$DownloadTaskCopyWithImpl<$Res> extends _$DownloadTaskCopyWithImpl<$Res>
    implements _$DownloadTaskCopyWith<$Res> {
  __$DownloadTaskCopyWithImpl(
      _DownloadTask _value, $Res Function(_DownloadTask) _then)
      : super(_value, (v) => _then(v as _DownloadTask));

  @override
  _DownloadTask get _value => super._value as _DownloadTask;

  @override
  $Res call({
    Object galleryId = freezed,
    Object totalCount = freezed,
    Object downloadedCount = freezed,
    Object createdAt = freezed,
    Object queuedAt = freezed,
    Object state = freezed,
    Object errorDetails = freezed,
  }) {
    return _then(_DownloadTask(
      galleryId: galleryId == freezed ? _value.galleryId : galleryId as int,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      downloadedCount: downloadedCount == freezed
          ? _value.downloadedCount
          : downloadedCount as int,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      queuedAt: queuedAt == freezed ? _value.queuedAt : queuedAt as DateTime,
      state: state == freezed ? _value.state : state as DownloadTaskState,
      errorDetails: errorDetails == freezed
          ? _value.errorDetails
          : errorDetails as String,
    ));
  }
}

class _$_DownloadTask extends _DownloadTask {
  const _$_DownloadTask(
      {@required this.galleryId,
      @required this.totalCount,
      this.downloadedCount = 0,
      @required this.createdAt,
      @required this.queuedAt,
      this.state = DownloadTaskState.pending,
      this.errorDetails})
      : assert(galleryId != null),
        assert(totalCount != null),
        assert(downloadedCount != null),
        assert(createdAt != null),
        assert(queuedAt != null),
        assert(state != null),
        super._();

  @override
  final int galleryId;
  @override
  final int totalCount;
  @JsonKey(defaultValue: 0)
  @override
  final int downloadedCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime queuedAt;
  @JsonKey(defaultValue: DownloadTaskState.pending)
  @override
  final DownloadTaskState state;
  @override
  final String errorDetails;

  @override
  String toString() {
    return 'DownloadTask(galleryId: $galleryId, totalCount: $totalCount, downloadedCount: $downloadedCount, createdAt: $createdAt, queuedAt: $queuedAt, state: $state, errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DownloadTask &&
            (identical(other.galleryId, galleryId) ||
                const DeepCollectionEquality()
                    .equals(other.galleryId, galleryId)) &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.downloadedCount, downloadedCount) ||
                const DeepCollectionEquality()
                    .equals(other.downloadedCount, downloadedCount)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.queuedAt, queuedAt) ||
                const DeepCollectionEquality()
                    .equals(other.queuedAt, queuedAt)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.errorDetails, errorDetails) ||
                const DeepCollectionEquality()
                    .equals(other.errorDetails, errorDetails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(galleryId) ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(downloadedCount) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(queuedAt) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(errorDetails);

  @override
  _$DownloadTaskCopyWith<_DownloadTask> get copyWith =>
      __$DownloadTaskCopyWithImpl<_DownloadTask>(this, _$identity);
}

abstract class _DownloadTask extends DownloadTask {
  const _DownloadTask._() : super._();
  const factory _DownloadTask(
      {@required int galleryId,
      @required int totalCount,
      int downloadedCount,
      @required DateTime createdAt,
      @required DateTime queuedAt,
      DownloadTaskState state,
      String errorDetails}) = _$_DownloadTask;

  @override
  int get galleryId;
  @override
  int get totalCount;
  @override
  int get downloadedCount;
  @override
  DateTime get createdAt;
  @override
  DateTime get queuedAt;
  @override
  DownloadTaskState get state;
  @override
  String get errorDetails;
  @override
  _$DownloadTaskCopyWith<_DownloadTask> get copyWith;
}

class _$DownloadTaskWithGalleryTearOff {
  const _$DownloadTaskWithGalleryTearOff();

// ignore: unused_element
  _DownloadTaskWithGallery call(
      {@required DownloadTask task, @required Gallery gallery}) {
    return _DownloadTaskWithGallery(
      task: task,
      gallery: gallery,
    );
  }
}

// ignore: unused_element
const $DownloadTaskWithGallery = _$DownloadTaskWithGalleryTearOff();

mixin _$DownloadTaskWithGallery {
  DownloadTask get task;
  Gallery get gallery;

  $DownloadTaskWithGalleryCopyWith<DownloadTaskWithGallery> get copyWith;
}

abstract class $DownloadTaskWithGalleryCopyWith<$Res> {
  factory $DownloadTaskWithGalleryCopyWith(DownloadTaskWithGallery value,
          $Res Function(DownloadTaskWithGallery) then) =
      _$DownloadTaskWithGalleryCopyWithImpl<$Res>;
  $Res call({DownloadTask task, Gallery gallery});

  $DownloadTaskCopyWith<$Res> get task;
  $GalleryCopyWith<$Res> get gallery;
}

class _$DownloadTaskWithGalleryCopyWithImpl<$Res>
    implements $DownloadTaskWithGalleryCopyWith<$Res> {
  _$DownloadTaskWithGalleryCopyWithImpl(this._value, this._then);

  final DownloadTaskWithGallery _value;
  // ignore: unused_field
  final $Res Function(DownloadTaskWithGallery) _then;

  @override
  $Res call({
    Object task = freezed,
    Object gallery = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed ? _value.task : task as DownloadTask,
      gallery: gallery == freezed ? _value.gallery : gallery as Gallery,
    ));
  }

  @override
  $DownloadTaskCopyWith<$Res> get task {
    if (_value.task == null) {
      return null;
    }
    return $DownloadTaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }

  @override
  $GalleryCopyWith<$Res> get gallery {
    if (_value.gallery == null) {
      return null;
    }
    return $GalleryCopyWith<$Res>(_value.gallery, (value) {
      return _then(_value.copyWith(gallery: value));
    });
  }
}

abstract class _$DownloadTaskWithGalleryCopyWith<$Res>
    implements $DownloadTaskWithGalleryCopyWith<$Res> {
  factory _$DownloadTaskWithGalleryCopyWith(_DownloadTaskWithGallery value,
          $Res Function(_DownloadTaskWithGallery) then) =
      __$DownloadTaskWithGalleryCopyWithImpl<$Res>;
  @override
  $Res call({DownloadTask task, Gallery gallery});

  @override
  $DownloadTaskCopyWith<$Res> get task;
  @override
  $GalleryCopyWith<$Res> get gallery;
}

class __$DownloadTaskWithGalleryCopyWithImpl<$Res>
    extends _$DownloadTaskWithGalleryCopyWithImpl<$Res>
    implements _$DownloadTaskWithGalleryCopyWith<$Res> {
  __$DownloadTaskWithGalleryCopyWithImpl(_DownloadTaskWithGallery _value,
      $Res Function(_DownloadTaskWithGallery) _then)
      : super(_value, (v) => _then(v as _DownloadTaskWithGallery));

  @override
  _DownloadTaskWithGallery get _value =>
      super._value as _DownloadTaskWithGallery;

  @override
  $Res call({
    Object task = freezed,
    Object gallery = freezed,
  }) {
    return _then(_DownloadTaskWithGallery(
      task: task == freezed ? _value.task : task as DownloadTask,
      gallery: gallery == freezed ? _value.gallery : gallery as Gallery,
    ));
  }
}

class _$_DownloadTaskWithGallery implements _DownloadTaskWithGallery {
  const _$_DownloadTaskWithGallery(
      {@required this.task, @required this.gallery})
      : assert(task != null),
        assert(gallery != null);

  @override
  final DownloadTask task;
  @override
  final Gallery gallery;

  @override
  String toString() {
    return 'DownloadTaskWithGallery(task: $task, gallery: $gallery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DownloadTaskWithGallery &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)) &&
            (identical(other.gallery, gallery) ||
                const DeepCollectionEquality().equals(other.gallery, gallery)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(task) ^
      const DeepCollectionEquality().hash(gallery);

  @override
  _$DownloadTaskWithGalleryCopyWith<_DownloadTaskWithGallery> get copyWith =>
      __$DownloadTaskWithGalleryCopyWithImpl<_DownloadTaskWithGallery>(
          this, _$identity);
}

abstract class _DownloadTaskWithGallery implements DownloadTaskWithGallery {
  const factory _DownloadTaskWithGallery(
      {@required DownloadTask task,
      @required Gallery gallery}) = _$_DownloadTaskWithGallery;

  @override
  DownloadTask get task;
  @override
  Gallery get gallery;
  @override
  _$DownloadTaskWithGalleryCopyWith<_DownloadTaskWithGallery> get copyWith;
}
