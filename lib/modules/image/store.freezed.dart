// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImageErrorTearOff {
  const _$ImageErrorTearOff();

  _ImageError call({required String message}) {
    return _ImageError(
      message: message,
    );
  }

  ImageErrorNotFound notFound({required int page}) {
    return ImageErrorNotFound(
      page: page,
    );
  }

  ImageErrorDisconnected disconnected() {
    return const ImageErrorDisconnected();
  }

  ImageErrorGalleryUnavailable galleryUnavailable() {
    return const ImageErrorGalleryUnavailable();
  }
}

/// @nodoc
const $ImageError = _$ImageErrorTearOff();

/// @nodoc
mixin _$ImageError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(int page) notFound,
    required TResult Function() disconnected,
    required TResult Function() galleryUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(int page)? notFound,
    TResult Function()? disconnected,
    TResult Function()? galleryUnavailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ImageError value) $default, {
    required TResult Function(ImageErrorNotFound value) notFound,
    required TResult Function(ImageErrorDisconnected value) disconnected,
    required TResult Function(ImageErrorGalleryUnavailable value)
        galleryUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ImageError value)? $default, {
    TResult Function(ImageErrorNotFound value)? notFound,
    TResult Function(ImageErrorDisconnected value)? disconnected,
    TResult Function(ImageErrorGalleryUnavailable value)? galleryUnavailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageErrorCopyWith<$Res> {
  factory $ImageErrorCopyWith(
          ImageError value, $Res Function(ImageError) then) =
      _$ImageErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageErrorCopyWithImpl<$Res> implements $ImageErrorCopyWith<$Res> {
  _$ImageErrorCopyWithImpl(this._value, this._then);

  final ImageError _value;
  // ignore: unused_field
  final $Res Function(ImageError) _then;
}

/// @nodoc
abstract class _$ImageErrorCopyWith<$Res> {
  factory _$ImageErrorCopyWith(
          _ImageError value, $Res Function(_ImageError) then) =
      __$ImageErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ImageErrorCopyWithImpl<$Res> extends _$ImageErrorCopyWithImpl<$Res>
    implements _$ImageErrorCopyWith<$Res> {
  __$ImageErrorCopyWithImpl(
      _ImageError _value, $Res Function(_ImageError) _then)
      : super(_value, (v) => _then(v as _ImageError));

  @override
  _ImageError get _value => super._value as _ImageError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ImageError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ImageError implements _ImageError {
  const _$_ImageError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ImageError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ImageErrorCopyWith<_ImageError> get copyWith =>
      __$ImageErrorCopyWithImpl<_ImageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(int page) notFound,
    required TResult Function() disconnected,
    required TResult Function() galleryUnavailable,
  }) {
    return $default(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(int page)? notFound,
    TResult Function()? disconnected,
    TResult Function()? galleryUnavailable,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ImageError value) $default, {
    required TResult Function(ImageErrorNotFound value) notFound,
    required TResult Function(ImageErrorDisconnected value) disconnected,
    required TResult Function(ImageErrorGalleryUnavailable value)
        galleryUnavailable,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ImageError value)? $default, {
    TResult Function(ImageErrorNotFound value)? notFound,
    TResult Function(ImageErrorDisconnected value)? disconnected,
    TResult Function(ImageErrorGalleryUnavailable value)? galleryUnavailable,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ImageError implements ImageError {
  const factory _ImageError({required String message}) = _$_ImageError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ImageErrorCopyWith<_ImageError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageErrorNotFoundCopyWith<$Res> {
  factory $ImageErrorNotFoundCopyWith(
          ImageErrorNotFound value, $Res Function(ImageErrorNotFound) then) =
      _$ImageErrorNotFoundCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$ImageErrorNotFoundCopyWithImpl<$Res>
    extends _$ImageErrorCopyWithImpl<$Res>
    implements $ImageErrorNotFoundCopyWith<$Res> {
  _$ImageErrorNotFoundCopyWithImpl(
      ImageErrorNotFound _value, $Res Function(ImageErrorNotFound) _then)
      : super(_value, (v) => _then(v as ImageErrorNotFound));

  @override
  ImageErrorNotFound get _value => super._value as ImageErrorNotFound;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(ImageErrorNotFound(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ImageErrorNotFound implements ImageErrorNotFound {
  const _$ImageErrorNotFound({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'ImageError.notFound(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImageErrorNotFound &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @JsonKey(ignore: true)
  @override
  $ImageErrorNotFoundCopyWith<ImageErrorNotFound> get copyWith =>
      _$ImageErrorNotFoundCopyWithImpl<ImageErrorNotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(int page) notFound,
    required TResult Function() disconnected,
    required TResult Function() galleryUnavailable,
  }) {
    return notFound(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(int page)? notFound,
    TResult Function()? disconnected,
    TResult Function()? galleryUnavailable,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ImageError value) $default, {
    required TResult Function(ImageErrorNotFound value) notFound,
    required TResult Function(ImageErrorDisconnected value) disconnected,
    required TResult Function(ImageErrorGalleryUnavailable value)
        galleryUnavailable,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ImageError value)? $default, {
    TResult Function(ImageErrorNotFound value)? notFound,
    TResult Function(ImageErrorDisconnected value)? disconnected,
    TResult Function(ImageErrorGalleryUnavailable value)? galleryUnavailable,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class ImageErrorNotFound implements ImageError {
  const factory ImageErrorNotFound({required int page}) = _$ImageErrorNotFound;

  int get page => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageErrorNotFoundCopyWith<ImageErrorNotFound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageErrorDisconnectedCopyWith<$Res> {
  factory $ImageErrorDisconnectedCopyWith(ImageErrorDisconnected value,
          $Res Function(ImageErrorDisconnected) then) =
      _$ImageErrorDisconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageErrorDisconnectedCopyWithImpl<$Res>
    extends _$ImageErrorCopyWithImpl<$Res>
    implements $ImageErrorDisconnectedCopyWith<$Res> {
  _$ImageErrorDisconnectedCopyWithImpl(ImageErrorDisconnected _value,
      $Res Function(ImageErrorDisconnected) _then)
      : super(_value, (v) => _then(v as ImageErrorDisconnected));

  @override
  ImageErrorDisconnected get _value => super._value as ImageErrorDisconnected;
}

/// @nodoc

class _$ImageErrorDisconnected implements ImageErrorDisconnected {
  const _$ImageErrorDisconnected();

  @override
  String toString() {
    return 'ImageError.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImageErrorDisconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(int page) notFound,
    required TResult Function() disconnected,
    required TResult Function() galleryUnavailable,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(int page)? notFound,
    TResult Function()? disconnected,
    TResult Function()? galleryUnavailable,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ImageError value) $default, {
    required TResult Function(ImageErrorNotFound value) notFound,
    required TResult Function(ImageErrorDisconnected value) disconnected,
    required TResult Function(ImageErrorGalleryUnavailable value)
        galleryUnavailable,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ImageError value)? $default, {
    TResult Function(ImageErrorNotFound value)? notFound,
    TResult Function(ImageErrorDisconnected value)? disconnected,
    TResult Function(ImageErrorGalleryUnavailable value)? galleryUnavailable,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class ImageErrorDisconnected implements ImageError {
  const factory ImageErrorDisconnected() = _$ImageErrorDisconnected;
}

/// @nodoc
abstract class $ImageErrorGalleryUnavailableCopyWith<$Res> {
  factory $ImageErrorGalleryUnavailableCopyWith(
          ImageErrorGalleryUnavailable value,
          $Res Function(ImageErrorGalleryUnavailable) then) =
      _$ImageErrorGalleryUnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageErrorGalleryUnavailableCopyWithImpl<$Res>
    extends _$ImageErrorCopyWithImpl<$Res>
    implements $ImageErrorGalleryUnavailableCopyWith<$Res> {
  _$ImageErrorGalleryUnavailableCopyWithImpl(
      ImageErrorGalleryUnavailable _value,
      $Res Function(ImageErrorGalleryUnavailable) _then)
      : super(_value, (v) => _then(v as ImageErrorGalleryUnavailable));

  @override
  ImageErrorGalleryUnavailable get _value =>
      super._value as ImageErrorGalleryUnavailable;
}

/// @nodoc

class _$ImageErrorGalleryUnavailable implements ImageErrorGalleryUnavailable {
  const _$ImageErrorGalleryUnavailable();

  @override
  String toString() {
    return 'ImageError.galleryUnavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImageErrorGalleryUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(int page) notFound,
    required TResult Function() disconnected,
    required TResult Function() galleryUnavailable,
  }) {
    return galleryUnavailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(int page)? notFound,
    TResult Function()? disconnected,
    TResult Function()? galleryUnavailable,
    required TResult orElse(),
  }) {
    if (galleryUnavailable != null) {
      return galleryUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ImageError value) $default, {
    required TResult Function(ImageErrorNotFound value) notFound,
    required TResult Function(ImageErrorDisconnected value) disconnected,
    required TResult Function(ImageErrorGalleryUnavailable value)
        galleryUnavailable,
  }) {
    return galleryUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ImageError value)? $default, {
    TResult Function(ImageErrorNotFound value)? notFound,
    TResult Function(ImageErrorDisconnected value)? disconnected,
    TResult Function(ImageErrorGalleryUnavailable value)? galleryUnavailable,
    required TResult orElse(),
  }) {
    if (galleryUnavailable != null) {
      return galleryUnavailable(this);
    }
    return orElse();
  }
}

abstract class ImageErrorGalleryUnavailable implements ImageError {
  const factory ImageErrorGalleryUnavailable() = _$ImageErrorGalleryUnavailable;
}
