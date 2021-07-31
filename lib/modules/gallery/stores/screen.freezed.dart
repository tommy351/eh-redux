// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GalleryErrorTearOff {
  const _$GalleryErrorTearOff();

  _GalleryError call({required String message}) {
    return _GalleryError(
      message: message,
    );
  }

  GalleryErrorContentWarning contentWarning({required String reason}) {
    return GalleryErrorContentWarning(
      reason: reason,
    );
  }

  GalleryErrorNotFound notFound() {
    return const GalleryErrorNotFound();
  }
}

/// @nodoc
const $GalleryError = _$GalleryErrorTearOff();

/// @nodoc
mixin _$GalleryError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(String reason) contentWarning,
    required TResult Function() notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(String reason)? contentWarning,
    TResult Function()? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GalleryError value) $default, {
    required TResult Function(GalleryErrorContentWarning value) contentWarning,
    required TResult Function(GalleryErrorNotFound value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GalleryError value)? $default, {
    TResult Function(GalleryErrorContentWarning value)? contentWarning,
    TResult Function(GalleryErrorNotFound value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
    Object? message = freezed,
  }) {
    return _then(_GalleryError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GalleryError implements _GalleryError {
  const _$_GalleryError({required this.message});

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

  @JsonKey(ignore: true)
  @override
  _$GalleryErrorCopyWith<_GalleryError> get copyWith =>
      __$GalleryErrorCopyWithImpl<_GalleryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(String reason) contentWarning,
    required TResult Function() notFound,
  }) {
    return $default(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(String reason)? contentWarning,
    TResult Function()? notFound,
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
    TResult Function(_GalleryError value) $default, {
    required TResult Function(GalleryErrorContentWarning value) contentWarning,
    required TResult Function(GalleryErrorNotFound value) notFound,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GalleryError value)? $default, {
    TResult Function(GalleryErrorContentWarning value)? contentWarning,
    TResult Function(GalleryErrorNotFound value)? notFound,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _GalleryError implements GalleryError {
  const factory _GalleryError({required String message}) = _$_GalleryError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GalleryErrorCopyWith<_GalleryError> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? reason = freezed,
  }) {
    return _then(GalleryErrorContentWarning(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GalleryErrorContentWarning implements GalleryErrorContentWarning {
  const _$GalleryErrorContentWarning({required this.reason});

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

  @JsonKey(ignore: true)
  @override
  $GalleryErrorContentWarningCopyWith<GalleryErrorContentWarning>
      get copyWith =>
          _$GalleryErrorContentWarningCopyWithImpl<GalleryErrorContentWarning>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(String reason) contentWarning,
    required TResult Function() notFound,
  }) {
    return contentWarning(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(String reason)? contentWarning,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (contentWarning != null) {
      return contentWarning(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GalleryError value) $default, {
    required TResult Function(GalleryErrorContentWarning value) contentWarning,
    required TResult Function(GalleryErrorNotFound value) notFound,
  }) {
    return contentWarning(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GalleryError value)? $default, {
    TResult Function(GalleryErrorContentWarning value)? contentWarning,
    TResult Function(GalleryErrorNotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (contentWarning != null) {
      return contentWarning(this);
    }
    return orElse();
  }
}

abstract class GalleryErrorContentWarning implements GalleryError {
  const factory GalleryErrorContentWarning({required String reason}) =
      _$GalleryErrorContentWarning;

  String get reason => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryErrorContentWarningCopyWith<GalleryErrorContentWarning>
      get copyWith => throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>(
    TResult Function(String message) $default, {
    required TResult Function(String reason) contentWarning,
    required TResult Function() notFound,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message)? $default, {
    TResult Function(String reason)? contentWarning,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GalleryError value) $default, {
    required TResult Function(GalleryErrorContentWarning value) contentWarning,
    required TResult Function(GalleryErrorNotFound value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GalleryError value)? $default, {
    TResult Function(GalleryErrorContentWarning value)? contentWarning,
    TResult Function(GalleryErrorNotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class GalleryErrorNotFound implements GalleryError {
  const factory GalleryErrorNotFound() = _$GalleryErrorNotFound;
}
