// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GalleryScreenArgumentsTearOff {
  const _$GalleryScreenArgumentsTearOff();

  _GalleryScreenArguments call({@required GalleryId id}) {
    return _GalleryScreenArguments(
      id: id,
    );
  }
}

// ignore: unused_element
const $GalleryScreenArguments = _$GalleryScreenArgumentsTearOff();

mixin _$GalleryScreenArguments {
  GalleryId get id;

  $GalleryScreenArgumentsCopyWith<GalleryScreenArguments> get copyWith;
}

abstract class $GalleryScreenArgumentsCopyWith<$Res> {
  factory $GalleryScreenArgumentsCopyWith(GalleryScreenArguments value,
          $Res Function(GalleryScreenArguments) then) =
      _$GalleryScreenArgumentsCopyWithImpl<$Res>;
  $Res call({GalleryId id});

  $GalleryIdCopyWith<$Res> get id;
}

class _$GalleryScreenArgumentsCopyWithImpl<$Res>
    implements $GalleryScreenArgumentsCopyWith<$Res> {
  _$GalleryScreenArgumentsCopyWithImpl(this._value, this._then);

  final GalleryScreenArguments _value;
  // ignore: unused_field
  final $Res Function(GalleryScreenArguments) _then;

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

abstract class _$GalleryScreenArgumentsCopyWith<$Res>
    implements $GalleryScreenArgumentsCopyWith<$Res> {
  factory _$GalleryScreenArgumentsCopyWith(_GalleryScreenArguments value,
          $Res Function(_GalleryScreenArguments) then) =
      __$GalleryScreenArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({GalleryId id});

  @override
  $GalleryIdCopyWith<$Res> get id;
}

class __$GalleryScreenArgumentsCopyWithImpl<$Res>
    extends _$GalleryScreenArgumentsCopyWithImpl<$Res>
    implements _$GalleryScreenArgumentsCopyWith<$Res> {
  __$GalleryScreenArgumentsCopyWithImpl(_GalleryScreenArguments _value,
      $Res Function(_GalleryScreenArguments) _then)
      : super(_value, (v) => _then(v as _GalleryScreenArguments));

  @override
  _GalleryScreenArguments get _value => super._value as _GalleryScreenArguments;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_GalleryScreenArguments(
      id: id == freezed ? _value.id : id as GalleryId,
    ));
  }
}

class _$_GalleryScreenArguments implements _GalleryScreenArguments {
  const _$_GalleryScreenArguments({@required this.id}) : assert(id != null);

  @override
  final GalleryId id;

  @override
  String toString() {
    return 'GalleryScreenArguments(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryScreenArguments &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$GalleryScreenArgumentsCopyWith<_GalleryScreenArguments> get copyWith =>
      __$GalleryScreenArgumentsCopyWithImpl<_GalleryScreenArguments>(
          this, _$identity);
}

abstract class _GalleryScreenArguments implements GalleryScreenArguments {
  const factory _GalleryScreenArguments({@required GalleryId id}) =
      _$_GalleryScreenArguments;

  @override
  GalleryId get id;
  @override
  _$GalleryScreenArgumentsCopyWith<_GalleryScreenArguments> get copyWith;
}
