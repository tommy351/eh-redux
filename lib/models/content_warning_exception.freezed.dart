// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'content_warning_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ContentWarningExceptionTearOff {
  const _$ContentWarningExceptionTearOff();

  _ContentWarningException call(
      {@required GalleryId galleryId, String reason = ''}) {
    return _ContentWarningException(
      galleryId: galleryId,
      reason: reason,
    );
  }
}

// ignore: unused_element
const $ContentWarningException = _$ContentWarningExceptionTearOff();

mixin _$ContentWarningException {
  GalleryId get galleryId;
  String get reason;

  $ContentWarningExceptionCopyWith<ContentWarningException> get copyWith;
}

abstract class $ContentWarningExceptionCopyWith<$Res> {
  factory $ContentWarningExceptionCopyWith(ContentWarningException value,
          $Res Function(ContentWarningException) then) =
      _$ContentWarningExceptionCopyWithImpl<$Res>;
  $Res call({GalleryId galleryId, String reason});

  $GalleryIdCopyWith<$Res> get galleryId;
}

class _$ContentWarningExceptionCopyWithImpl<$Res>
    implements $ContentWarningExceptionCopyWith<$Res> {
  _$ContentWarningExceptionCopyWithImpl(this._value, this._then);

  final ContentWarningException _value;
  // ignore: unused_field
  final $Res Function(ContentWarningException) _then;

  @override
  $Res call({
    Object galleryId = freezed,
    Object reason = freezed,
  }) {
    return _then(_value.copyWith(
      galleryId:
          galleryId == freezed ? _value.galleryId : galleryId as GalleryId,
      reason: reason == freezed ? _value.reason : reason as String,
    ));
  }

  @override
  $GalleryIdCopyWith<$Res> get galleryId {
    if (_value.galleryId == null) {
      return null;
    }
    return $GalleryIdCopyWith<$Res>(_value.galleryId, (value) {
      return _then(_value.copyWith(galleryId: value));
    });
  }
}

abstract class _$ContentWarningExceptionCopyWith<$Res>
    implements $ContentWarningExceptionCopyWith<$Res> {
  factory _$ContentWarningExceptionCopyWith(_ContentWarningException value,
          $Res Function(_ContentWarningException) then) =
      __$ContentWarningExceptionCopyWithImpl<$Res>;
  @override
  $Res call({GalleryId galleryId, String reason});

  @override
  $GalleryIdCopyWith<$Res> get galleryId;
}

class __$ContentWarningExceptionCopyWithImpl<$Res>
    extends _$ContentWarningExceptionCopyWithImpl<$Res>
    implements _$ContentWarningExceptionCopyWith<$Res> {
  __$ContentWarningExceptionCopyWithImpl(_ContentWarningException _value,
      $Res Function(_ContentWarningException) _then)
      : super(_value, (v) => _then(v as _ContentWarningException));

  @override
  _ContentWarningException get _value =>
      super._value as _ContentWarningException;

  @override
  $Res call({
    Object galleryId = freezed,
    Object reason = freezed,
  }) {
    return _then(_ContentWarningException(
      galleryId:
          galleryId == freezed ? _value.galleryId : galleryId as GalleryId,
      reason: reason == freezed ? _value.reason : reason as String,
    ));
  }
}

class _$_ContentWarningException implements _ContentWarningException {
  const _$_ContentWarningException({@required this.galleryId, this.reason = ''})
      : assert(galleryId != null),
        assert(reason != null);

  @override
  final GalleryId galleryId;
  @JsonKey(defaultValue: '')
  @override
  final String reason;

  @override
  String toString() {
    return 'ContentWarningException(galleryId: $galleryId, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentWarningException &&
            (identical(other.galleryId, galleryId) ||
                const DeepCollectionEquality()
                    .equals(other.galleryId, galleryId)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(galleryId) ^
      const DeepCollectionEquality().hash(reason);

  @override
  _$ContentWarningExceptionCopyWith<_ContentWarningException> get copyWith =>
      __$ContentWarningExceptionCopyWithImpl<_ContentWarningException>(
          this, _$identity);
}

abstract class _ContentWarningException implements ContentWarningException {
  const factory _ContentWarningException(
      {@required GalleryId galleryId,
      String reason}) = _$_ContentWarningException;

  @override
  GalleryId get galleryId;
  @override
  String get reason;
  @override
  _$ContentWarningExceptionCopyWith<_ContentWarningException> get copyWith;
}
