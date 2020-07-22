// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DownloadTaskTearOff {
  const _$DownloadTaskTearOff();

  _DownloadTask call(
      {@required int galleryId,
      DownloadTaskState state = DownloadTaskState.created,
      int current = 0,
      @required int total,
      @required DateTime createdAt}) {
    return _DownloadTask(
      galleryId: galleryId,
      state: state,
      current: current,
      total: total,
      createdAt: createdAt,
    );
  }
}

// ignore: unused_element
const $DownloadTask = _$DownloadTaskTearOff();

mixin _$DownloadTask {
  int get galleryId;
  DownloadTaskState get state;
  int get current;
  int get total;
  DateTime get createdAt;

  $DownloadTaskCopyWith<DownloadTask> get copyWith;
}

abstract class $DownloadTaskCopyWith<$Res> {
  factory $DownloadTaskCopyWith(
          DownloadTask value, $Res Function(DownloadTask) then) =
      _$DownloadTaskCopyWithImpl<$Res>;
  $Res call(
      {int galleryId,
      DownloadTaskState state,
      int current,
      int total,
      DateTime createdAt});
}

class _$DownloadTaskCopyWithImpl<$Res> implements $DownloadTaskCopyWith<$Res> {
  _$DownloadTaskCopyWithImpl(this._value, this._then);

  final DownloadTask _value;
  // ignore: unused_field
  final $Res Function(DownloadTask) _then;

  @override
  $Res call({
    Object galleryId = freezed,
    Object state = freezed,
    Object current = freezed,
    Object total = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId: galleryId == freezed ? _value.galleryId : galleryId as int,
      state: state == freezed ? _value.state : state as DownloadTaskState,
      current: current == freezed ? _value.current : current as int,
      total: total == freezed ? _value.total : total as int,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
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
      DownloadTaskState state,
      int current,
      int total,
      DateTime createdAt});
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
    Object state = freezed,
    Object current = freezed,
    Object total = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_DownloadTask(
      galleryId: galleryId == freezed ? _value.galleryId : galleryId as int,
      state: state == freezed ? _value.state : state as DownloadTaskState,
      current: current == freezed ? _value.current : current as int,
      total: total == freezed ? _value.total : total as int,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
    ));
  }
}

class _$_DownloadTask extends _DownloadTask {
  const _$_DownloadTask(
      {@required this.galleryId,
      this.state = DownloadTaskState.created,
      this.current = 0,
      @required this.total,
      @required this.createdAt})
      : assert(galleryId != null),
        assert(state != null),
        assert(current != null),
        assert(total != null),
        assert(createdAt != null),
        super._();

  @override
  final int galleryId;
  @JsonKey(defaultValue: DownloadTaskState.created)
  @override
  final DownloadTaskState state;
  @JsonKey(defaultValue: 0)
  @override
  final int current;
  @override
  final int total;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DownloadTask(galleryId: $galleryId, state: $state, current: $current, total: $total, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DownloadTask &&
            (identical(other.galleryId, galleryId) ||
                const DeepCollectionEquality()
                    .equals(other.galleryId, galleryId)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(galleryId) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(createdAt);

  @override
  _$DownloadTaskCopyWith<_DownloadTask> get copyWith =>
      __$DownloadTaskCopyWithImpl<_DownloadTask>(this, _$identity);
}

abstract class _DownloadTask extends DownloadTask {
  const _DownloadTask._() : super._();
  const factory _DownloadTask(
      {@required int galleryId,
      DownloadTaskState state,
      int current,
      @required int total,
      @required DateTime createdAt}) = _$_DownloadTask;

  @override
  int get galleryId;
  @override
  DownloadTaskState get state;
  @override
  int get current;
  @override
  int get total;
  @override
  DateTime get createdAt;
  @override
  _$DownloadTaskCopyWith<_DownloadTask> get copyWith;
}

class _$DownloadedImageTearOff {
  const _$DownloadedImageTearOff();

  _DownloadedImage call(
      {@required int galleryId,
      @required int imagePage,
      @required int width,
      @required int height,
      @required int size,
      @required String path,
      @required DateTime downloadedAt}) {
    return _DownloadedImage(
      galleryId: galleryId,
      imagePage: imagePage,
      width: width,
      height: height,
      size: size,
      path: path,
      downloadedAt: downloadedAt,
    );
  }
}

// ignore: unused_element
const $DownloadedImage = _$DownloadedImageTearOff();

mixin _$DownloadedImage {
  int get galleryId;
  int get imagePage;
  int get width;
  int get height;
  int get size;
  String get path;
  DateTime get downloadedAt;

  $DownloadedImageCopyWith<DownloadedImage> get copyWith;
}

abstract class $DownloadedImageCopyWith<$Res> {
  factory $DownloadedImageCopyWith(
          DownloadedImage value, $Res Function(DownloadedImage) then) =
      _$DownloadedImageCopyWithImpl<$Res>;
  $Res call(
      {int galleryId,
      int imagePage,
      int width,
      int height,
      int size,
      String path,
      DateTime downloadedAt});
}

class _$DownloadedImageCopyWithImpl<$Res>
    implements $DownloadedImageCopyWith<$Res> {
  _$DownloadedImageCopyWithImpl(this._value, this._then);

  final DownloadedImage _value;
  // ignore: unused_field
  final $Res Function(DownloadedImage) _then;

  @override
  $Res call({
    Object galleryId = freezed,
    Object imagePage = freezed,
    Object width = freezed,
    Object height = freezed,
    Object size = freezed,
    Object path = freezed,
    Object downloadedAt = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId: galleryId == freezed ? _value.galleryId : galleryId as int,
      imagePage: imagePage == freezed ? _value.imagePage : imagePage as int,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      size: size == freezed ? _value.size : size as int,
      path: path == freezed ? _value.path : path as String,
      downloadedAt: downloadedAt == freezed
          ? _value.downloadedAt
          : downloadedAt as DateTime,
    ));
  }
}

abstract class _$DownloadedImageCopyWith<$Res>
    implements $DownloadedImageCopyWith<$Res> {
  factory _$DownloadedImageCopyWith(
          _DownloadedImage value, $Res Function(_DownloadedImage) then) =
      __$DownloadedImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int galleryId,
      int imagePage,
      int width,
      int height,
      int size,
      String path,
      DateTime downloadedAt});
}

class __$DownloadedImageCopyWithImpl<$Res>
    extends _$DownloadedImageCopyWithImpl<$Res>
    implements _$DownloadedImageCopyWith<$Res> {
  __$DownloadedImageCopyWithImpl(
      _DownloadedImage _value, $Res Function(_DownloadedImage) _then)
      : super(_value, (v) => _then(v as _DownloadedImage));

  @override
  _DownloadedImage get _value => super._value as _DownloadedImage;

  @override
  $Res call({
    Object galleryId = freezed,
    Object imagePage = freezed,
    Object width = freezed,
    Object height = freezed,
    Object size = freezed,
    Object path = freezed,
    Object downloadedAt = freezed,
  }) {
    return _then(_DownloadedImage(
      galleryId: galleryId == freezed ? _value.galleryId : galleryId as int,
      imagePage: imagePage == freezed ? _value.imagePage : imagePage as int,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      size: size == freezed ? _value.size : size as int,
      path: path == freezed ? _value.path : path as String,
      downloadedAt: downloadedAt == freezed
          ? _value.downloadedAt
          : downloadedAt as DateTime,
    ));
  }
}

class _$_DownloadedImage extends _DownloadedImage {
  const _$_DownloadedImage(
      {@required this.galleryId,
      @required this.imagePage,
      @required this.width,
      @required this.height,
      @required this.size,
      @required this.path,
      @required this.downloadedAt})
      : assert(galleryId != null),
        assert(imagePage != null),
        assert(width != null),
        assert(height != null),
        assert(size != null),
        assert(path != null),
        assert(downloadedAt != null),
        super._();

  @override
  final int galleryId;
  @override
  final int imagePage;
  @override
  final int width;
  @override
  final int height;
  @override
  final int size;
  @override
  final String path;
  @override
  final DateTime downloadedAt;

  @override
  String toString() {
    return 'DownloadedImage(galleryId: $galleryId, imagePage: $imagePage, width: $width, height: $height, size: $size, path: $path, downloadedAt: $downloadedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DownloadedImage &&
            (identical(other.galleryId, galleryId) ||
                const DeepCollectionEquality()
                    .equals(other.galleryId, galleryId)) &&
            (identical(other.imagePage, imagePage) ||
                const DeepCollectionEquality()
                    .equals(other.imagePage, imagePage)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.downloadedAt, downloadedAt) ||
                const DeepCollectionEquality()
                    .equals(other.downloadedAt, downloadedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(galleryId) ^
      const DeepCollectionEquality().hash(imagePage) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(downloadedAt);

  @override
  _$DownloadedImageCopyWith<_DownloadedImage> get copyWith =>
      __$DownloadedImageCopyWithImpl<_DownloadedImage>(this, _$identity);
}

abstract class _DownloadedImage extends DownloadedImage {
  const _DownloadedImage._() : super._();
  const factory _DownloadedImage(
      {@required int galleryId,
      @required int imagePage,
      @required int width,
      @required int height,
      @required int size,
      @required String path,
      @required DateTime downloadedAt}) = _$_DownloadedImage;

  @override
  int get galleryId;
  @override
  int get imagePage;
  @override
  int get width;
  @override
  int get height;
  @override
  int get size;
  @override
  String get path;
  @override
  DateTime get downloadedAt;
  @override
  _$DownloadedImageCopyWith<_DownloadedImage> get copyWith;
}
