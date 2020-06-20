// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ViewScreenArgumentsTearOff {
  const _$ViewScreenArgumentsTearOff();

  _ViewScreenArguments call({@required GalleryId id}) {
    return _ViewScreenArguments(
      id: id,
    );
  }
}

// ignore: unused_element
const $ViewScreenArguments = _$ViewScreenArgumentsTearOff();

mixin _$ViewScreenArguments {
  GalleryId get id;

  $ViewScreenArgumentsCopyWith<ViewScreenArguments> get copyWith;
}

abstract class $ViewScreenArgumentsCopyWith<$Res> {
  factory $ViewScreenArgumentsCopyWith(
          ViewScreenArguments value, $Res Function(ViewScreenArguments) then) =
      _$ViewScreenArgumentsCopyWithImpl<$Res>;
  $Res call({GalleryId id});

  $GalleryIdCopyWith<$Res> get id;
}

class _$ViewScreenArgumentsCopyWithImpl<$Res>
    implements $ViewScreenArgumentsCopyWith<$Res> {
  _$ViewScreenArgumentsCopyWithImpl(this._value, this._then);

  final ViewScreenArguments _value;
  // ignore: unused_field
  final $Res Function(ViewScreenArguments) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as GalleryId,
    ));
  }

  @override
  $GalleryIdCopyWith<$Res> get id {
    if (_value.id == null) {
      return null;
    }
    return $GalleryIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

abstract class _$ViewScreenArgumentsCopyWith<$Res>
    implements $ViewScreenArgumentsCopyWith<$Res> {
  factory _$ViewScreenArgumentsCopyWith(_ViewScreenArguments value,
          $Res Function(_ViewScreenArguments) then) =
      __$ViewScreenArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({GalleryId id});

  @override
  $GalleryIdCopyWith<$Res> get id;
}

class __$ViewScreenArgumentsCopyWithImpl<$Res>
    extends _$ViewScreenArgumentsCopyWithImpl<$Res>
    implements _$ViewScreenArgumentsCopyWith<$Res> {
  __$ViewScreenArgumentsCopyWithImpl(
      _ViewScreenArguments _value, $Res Function(_ViewScreenArguments) _then)
      : super(_value, (v) => _then(v as _ViewScreenArguments));

  @override
  _ViewScreenArguments get _value => super._value as _ViewScreenArguments;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_ViewScreenArguments(
      id: id == freezed ? _value.id : id as GalleryId,
    ));
  }
}

class _$_ViewScreenArguments implements _ViewScreenArguments {
  const _$_ViewScreenArguments({@required this.id}) : assert(id != null);

  @override
  final GalleryId id;

  @override
  String toString() {
    return 'ViewScreenArguments(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViewScreenArguments &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$ViewScreenArgumentsCopyWith<_ViewScreenArguments> get copyWith =>
      __$ViewScreenArgumentsCopyWithImpl<_ViewScreenArguments>(
          this, _$identity);
}

abstract class _ViewScreenArguments implements ViewScreenArguments {
  const factory _ViewScreenArguments({@required GalleryId id}) =
      _$_ViewScreenArguments;

  @override
  GalleryId get id;
  @override
  _$ViewScreenArgumentsCopyWith<_ViewScreenArguments> get copyWith;
}
