// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ImageErrorTearOff {
  const _$ImageErrorTearOff();

// ignore: unused_element
  _ImageError call({@required String message}) {
    return _ImageError(
      message: message,
    );
  }

// ignore: unused_element
  ImageErrorNotFound notFound({@required int page}) {
    return ImageErrorNotFound(
      page: page,
    );
  }

// ignore: unused_element
  ImageErrorDisconnected disconnected() {
    return const ImageErrorDisconnected();
  }

// ignore: unused_element
  ImageErrorGalleryUnavailable galleryUnavailable() {
    return const ImageErrorGalleryUnavailable();
  }
}

// ignore: unused_element
const $ImageError = _$ImageErrorTearOff();

mixin _$ImageError {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result notFound(int page),
    @required Result disconnected(),
    @required Result galleryUnavailable(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result notFound(int page),
    Result disconnected(),
    Result galleryUnavailable(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageError value), {
    @required Result notFound(ImageErrorNotFound value),
    @required Result disconnected(ImageErrorDisconnected value),
    @required Result galleryUnavailable(ImageErrorGalleryUnavailable value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageError value), {
    Result notFound(ImageErrorNotFound value),
    Result disconnected(ImageErrorDisconnected value),
    Result galleryUnavailable(ImageErrorGalleryUnavailable value),
    @required Result orElse(),
  });
}

abstract class $ImageErrorCopyWith<$Res> {
  factory $ImageErrorCopyWith(
          ImageError value, $Res Function(ImageError) then) =
      _$ImageErrorCopyWithImpl<$Res>;
}

class _$ImageErrorCopyWithImpl<$Res> implements $ImageErrorCopyWith<$Res> {
  _$ImageErrorCopyWithImpl(this._value, this._then);

  final ImageError _value;
  // ignore: unused_field
  final $Res Function(ImageError) _then;
}

abstract class _$ImageErrorCopyWith<$Res> {
  factory _$ImageErrorCopyWith(
          _ImageError value, $Res Function(_ImageError) then) =
      __$ImageErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$ImageErrorCopyWithImpl<$Res> extends _$ImageErrorCopyWithImpl<$Res>
    implements _$ImageErrorCopyWith<$Res> {
  __$ImageErrorCopyWithImpl(
      _ImageError _value, $Res Function(_ImageError) _then)
      : super(_value, (v) => _then(v as _ImageError));

  @override
  _ImageError get _value => super._value as _ImageError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_ImageError(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_ImageError implements _ImageError {
  const _$_ImageError({@required this.message}) : assert(message != null);

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

  @override
  _$ImageErrorCopyWith<_ImageError> get copyWith =>
      __$ImageErrorCopyWithImpl<_ImageError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result notFound(int page),
    @required Result disconnected(),
    @required Result galleryUnavailable(),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return $default(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result notFound(int page),
    Result disconnected(),
    Result galleryUnavailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageError value), {
    @required Result notFound(ImageErrorNotFound value),
    @required Result disconnected(ImageErrorDisconnected value),
    @required Result galleryUnavailable(ImageErrorGalleryUnavailable value),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageError value), {
    Result notFound(ImageErrorNotFound value),
    Result disconnected(ImageErrorDisconnected value),
    Result galleryUnavailable(ImageErrorGalleryUnavailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ImageError implements ImageError {
  const factory _ImageError({@required String message}) = _$_ImageError;

  String get message;
  _$ImageErrorCopyWith<_ImageError> get copyWith;
}

abstract class $ImageErrorNotFoundCopyWith<$Res> {
  factory $ImageErrorNotFoundCopyWith(
          ImageErrorNotFound value, $Res Function(ImageErrorNotFound) then) =
      _$ImageErrorNotFoundCopyWithImpl<$Res>;
  $Res call({int page});
}

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
    Object page = freezed,
  }) {
    return _then(ImageErrorNotFound(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

class _$ImageErrorNotFound implements ImageErrorNotFound {
  const _$ImageErrorNotFound({@required this.page}) : assert(page != null);

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

  @override
  $ImageErrorNotFoundCopyWith<ImageErrorNotFound> get copyWith =>
      _$ImageErrorNotFoundCopyWithImpl<ImageErrorNotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result notFound(int page),
    @required Result disconnected(),
    @required Result galleryUnavailable(),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return notFound(page);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result notFound(int page),
    Result disconnected(),
    Result galleryUnavailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageError value), {
    @required Result notFound(ImageErrorNotFound value),
    @required Result disconnected(ImageErrorDisconnected value),
    @required Result galleryUnavailable(ImageErrorGalleryUnavailable value),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageError value), {
    Result notFound(ImageErrorNotFound value),
    Result disconnected(ImageErrorDisconnected value),
    Result galleryUnavailable(ImageErrorGalleryUnavailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class ImageErrorNotFound implements ImageError {
  const factory ImageErrorNotFound({@required int page}) = _$ImageErrorNotFound;

  int get page;
  $ImageErrorNotFoundCopyWith<ImageErrorNotFound> get copyWith;
}

abstract class $ImageErrorDisconnectedCopyWith<$Res> {
  factory $ImageErrorDisconnectedCopyWith(ImageErrorDisconnected value,
          $Res Function(ImageErrorDisconnected) then) =
      _$ImageErrorDisconnectedCopyWithImpl<$Res>;
}

class _$ImageErrorDisconnectedCopyWithImpl<$Res>
    extends _$ImageErrorCopyWithImpl<$Res>
    implements $ImageErrorDisconnectedCopyWith<$Res> {
  _$ImageErrorDisconnectedCopyWithImpl(ImageErrorDisconnected _value,
      $Res Function(ImageErrorDisconnected) _then)
      : super(_value, (v) => _then(v as ImageErrorDisconnected));

  @override
  ImageErrorDisconnected get _value => super._value as ImageErrorDisconnected;
}

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
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result notFound(int page),
    @required Result disconnected(),
    @required Result galleryUnavailable(),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return disconnected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result notFound(int page),
    Result disconnected(),
    Result galleryUnavailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageError value), {
    @required Result notFound(ImageErrorNotFound value),
    @required Result disconnected(ImageErrorDisconnected value),
    @required Result galleryUnavailable(ImageErrorGalleryUnavailable value),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageError value), {
    Result notFound(ImageErrorNotFound value),
    Result disconnected(ImageErrorDisconnected value),
    Result galleryUnavailable(ImageErrorGalleryUnavailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class ImageErrorDisconnected implements ImageError {
  const factory ImageErrorDisconnected() = _$ImageErrorDisconnected;
}

abstract class $ImageErrorGalleryUnavailableCopyWith<$Res> {
  factory $ImageErrorGalleryUnavailableCopyWith(
          ImageErrorGalleryUnavailable value,
          $Res Function(ImageErrorGalleryUnavailable) then) =
      _$ImageErrorGalleryUnavailableCopyWithImpl<$Res>;
}

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
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result notFound(int page),
    @required Result disconnected(),
    @required Result galleryUnavailable(),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return galleryUnavailable();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result notFound(int page),
    Result disconnected(),
    Result galleryUnavailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (galleryUnavailable != null) {
      return galleryUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageError value), {
    @required Result notFound(ImageErrorNotFound value),
    @required Result disconnected(ImageErrorDisconnected value),
    @required Result galleryUnavailable(ImageErrorGalleryUnavailable value),
  }) {
    assert($default != null);
    assert(notFound != null);
    assert(disconnected != null);
    assert(galleryUnavailable != null);
    return galleryUnavailable(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageError value), {
    Result notFound(ImageErrorNotFound value),
    Result disconnected(ImageErrorDisconnected value),
    Result galleryUnavailable(ImageErrorGalleryUnavailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (galleryUnavailable != null) {
      return galleryUnavailable(this);
    }
    return orElse();
  }
}

abstract class ImageErrorGalleryUnavailable implements ImageError {
  const factory ImageErrorGalleryUnavailable() = _$ImageErrorGalleryUnavailable;
}
