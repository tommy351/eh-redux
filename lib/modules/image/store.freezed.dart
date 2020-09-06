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
  ImageErrorNotFound notFound() {
    return const ImageErrorNotFound();
  }
}

// ignore: unused_element
const $ImageError = _$ImageErrorTearOff();

mixin _$ImageError {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notFound(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notFound(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notFound(ImageErrorNotFound value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notFound(ImageErrorNotFound value),
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

abstract class $ImageErrorNotFoundCopyWith<$Res> {
  factory $ImageErrorNotFoundCopyWith(
          ImageErrorNotFound value, $Res Function(ImageErrorNotFound) then) =
      _$ImageErrorNotFoundCopyWithImpl<$Res>;
}

class _$ImageErrorNotFoundCopyWithImpl<$Res>
    extends _$ImageErrorCopyWithImpl<$Res>
    implements $ImageErrorNotFoundCopyWith<$Res> {
  _$ImageErrorNotFoundCopyWithImpl(
      ImageErrorNotFound _value, $Res Function(ImageErrorNotFound) _then)
      : super(_value, (v) => _then(v as ImageErrorNotFound));

  @override
  ImageErrorNotFound get _value => super._value as ImageErrorNotFound;
}

class _$ImageErrorNotFound implements ImageErrorNotFound {
  const _$ImageErrorNotFound();

  @override
  String toString() {
    return 'ImageError.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImageErrorNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notFound(),
  }) {
    assert(notFound != null);
    return notFound();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
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
  Result map<Result extends Object>({
    @required Result notFound(ImageErrorNotFound value),
  }) {
    assert(notFound != null);
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notFound(ImageErrorNotFound value),
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
  const factory ImageErrorNotFound() = _$ImageErrorNotFound;
}
