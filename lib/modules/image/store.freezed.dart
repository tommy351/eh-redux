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
  ImageErrorNotFound notFound({@required int page}) {
    return ImageErrorNotFound(
      page: page,
    );
  }
}

// ignore: unused_element
const $ImageError = _$ImageErrorTearOff();

mixin _$ImageError {
  int get page;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notFound(int page),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notFound(int page),
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

  $ImageErrorCopyWith<ImageError> get copyWith;
}

abstract class $ImageErrorCopyWith<$Res> {
  factory $ImageErrorCopyWith(
          ImageError value, $Res Function(ImageError) then) =
      _$ImageErrorCopyWithImpl<$Res>;
  $Res call({int page});
}

class _$ImageErrorCopyWithImpl<$Res> implements $ImageErrorCopyWith<$Res> {
  _$ImageErrorCopyWithImpl(this._value, this._then);

  final ImageError _value;
  // ignore: unused_field
  final $Res Function(ImageError) _then;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

abstract class $ImageErrorNotFoundCopyWith<$Res>
    implements $ImageErrorCopyWith<$Res> {
  factory $ImageErrorNotFoundCopyWith(
          ImageErrorNotFound value, $Res Function(ImageErrorNotFound) then) =
      _$ImageErrorNotFoundCopyWithImpl<$Res>;
  @override
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
  Result when<Result extends Object>({
    @required Result notFound(int page),
  }) {
    assert(notFound != null);
    return notFound(page);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notFound(int page),
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
  const factory ImageErrorNotFound({@required int page}) = _$ImageErrorNotFound;

  @override
  int get page;
  @override
  $ImageErrorNotFoundCopyWith<ImageErrorNotFound> get copyWith;
}
