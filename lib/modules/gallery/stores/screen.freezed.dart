// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GalleryErrorTearOff {
  const _$GalleryErrorTearOff();

// ignore: unused_element
  _GalleryError call({@required String message}) {
    return _GalleryError(
      message: message,
    );
  }

// ignore: unused_element
  GalleryErrorContentWarning contentWarning({@required String reason}) {
    return GalleryErrorContentWarning(
      reason: reason,
    );
  }

// ignore: unused_element
  GalleryErrorNotFound notFound() {
    return const GalleryErrorNotFound();
  }
}

/// @nodoc
// ignore: unused_element
const $GalleryError = _$GalleryErrorTearOff();

/// @nodoc
mixin _$GalleryError {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
    @required Result notFound(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    Result notFound(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
    @required Result notFound(GalleryErrorNotFound value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    Result notFound(GalleryErrorNotFound value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GalleryErrorCopyWith<$Res> {
  factory $GalleryErrorCopyWith(
          GalleryError value, $Res Function(GalleryError) then) =
      _$GalleryErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryErrorCopyWithImpl<$Res> implements $GalleryErrorCopyWith<$Res> {
  _$GalleryErrorCopyWithImpl(this._value, this._then);

  final GalleryError _value;
  // ignore: unused_field
  final $Res Function(GalleryError) _then;
}

/// @nodoc
abstract class _$GalleryErrorCopyWith<$Res> {
  factory _$GalleryErrorCopyWith(
          _GalleryError value, $Res Function(_GalleryError) then) =
      __$GalleryErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$GalleryErrorCopyWithImpl<$Res> extends _$GalleryErrorCopyWithImpl<$Res>
    implements _$GalleryErrorCopyWith<$Res> {
  __$GalleryErrorCopyWithImpl(
      _GalleryError _value, $Res Function(_GalleryError) _then)
      : super(_value, (v) => _then(v as _GalleryError));

  @override
  _GalleryError get _value => super._value as _GalleryError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_GalleryError(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_GalleryError implements _GalleryError {
  const _$_GalleryError({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'GalleryError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$GalleryErrorCopyWith<_GalleryError> get copyWith =>
      __$GalleryErrorCopyWithImpl<_GalleryError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
    @required Result notFound(),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    assert(notFound != null);
    return $default(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    Result notFound(),
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
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
    @required Result notFound(GalleryErrorNotFound value),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    assert(notFound != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    Result notFound(GalleryErrorNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _GalleryError implements GalleryError {
  const factory _GalleryError({@required String message}) = _$_GalleryError;

  String get message;
  _$GalleryErrorCopyWith<_GalleryError> get copyWith;
}

/// @nodoc
abstract class $GalleryErrorContentWarningCopyWith<$Res> {
  factory $GalleryErrorContentWarningCopyWith(GalleryErrorContentWarning value,
          $Res Function(GalleryErrorContentWarning) then) =
      _$GalleryErrorContentWarningCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$GalleryErrorContentWarningCopyWithImpl<$Res>
    extends _$GalleryErrorCopyWithImpl<$Res>
    implements $GalleryErrorContentWarningCopyWith<$Res> {
  _$GalleryErrorContentWarningCopyWithImpl(GalleryErrorContentWarning _value,
      $Res Function(GalleryErrorContentWarning) _then)
      : super(_value, (v) => _then(v as GalleryErrorContentWarning));

  @override
  GalleryErrorContentWarning get _value =>
      super._value as GalleryErrorContentWarning;

  @override
  $Res call({
    Object reason = freezed,
  }) {
    return _then(GalleryErrorContentWarning(
      reason: reason == freezed ? _value.reason : reason as String,
    ));
  }
}

/// @nodoc
class _$GalleryErrorContentWarning implements GalleryErrorContentWarning {
  const _$GalleryErrorContentWarning({@required this.reason})
      : assert(reason != null);

  @override
  final String reason;

  @override
  String toString() {
    return 'GalleryError.contentWarning(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryErrorContentWarning &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @override
  $GalleryErrorContentWarningCopyWith<GalleryErrorContentWarning>
      get copyWith =>
          _$GalleryErrorContentWarningCopyWithImpl<GalleryErrorContentWarning>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
    @required Result notFound(),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    assert(notFound != null);
    return contentWarning(reason);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    Result notFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (contentWarning != null) {
      return contentWarning(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
    @required Result notFound(GalleryErrorNotFound value),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    assert(notFound != null);
    return contentWarning(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    Result notFound(GalleryErrorNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (contentWarning != null) {
      return contentWarning(this);
    }
    return orElse();
  }
}

abstract class GalleryErrorContentWarning implements GalleryError {
  const factory GalleryErrorContentWarning({@required String reason}) =
      _$GalleryErrorContentWarning;

  String get reason;
  $GalleryErrorContentWarningCopyWith<GalleryErrorContentWarning> get copyWith;
}

/// @nodoc
abstract class $GalleryErrorNotFoundCopyWith<$Res> {
  factory $GalleryErrorNotFoundCopyWith(GalleryErrorNotFound value,
          $Res Function(GalleryErrorNotFound) then) =
      _$GalleryErrorNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryErrorNotFoundCopyWithImpl<$Res>
    extends _$GalleryErrorCopyWithImpl<$Res>
    implements $GalleryErrorNotFoundCopyWith<$Res> {
  _$GalleryErrorNotFoundCopyWithImpl(
      GalleryErrorNotFound _value, $Res Function(GalleryErrorNotFound) _then)
      : super(_value, (v) => _then(v as GalleryErrorNotFound));

  @override
  GalleryErrorNotFound get _value => super._value as GalleryErrorNotFound;
}

/// @nodoc
class _$GalleryErrorNotFound implements GalleryErrorNotFound {
  const _$GalleryErrorNotFound();

  @override
  String toString() {
    return 'GalleryError.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GalleryErrorNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String message), {
    @required Result contentWarning(String reason),
    @required Result notFound(),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    assert(notFound != null);
    return notFound();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String message), {
    Result contentWarning(String reason),
    Result notFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_GalleryError value), {
    @required Result contentWarning(GalleryErrorContentWarning value),
    @required Result notFound(GalleryErrorNotFound value),
  }) {
    assert($default != null);
    assert(contentWarning != null);
    assert(notFound != null);
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_GalleryError value), {
    Result contentWarning(GalleryErrorContentWarning value),
    Result notFound(GalleryErrorNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class GalleryErrorNotFound implements GalleryError {
  const factory GalleryErrorNotFound() = _$GalleryErrorNotFound;
}
