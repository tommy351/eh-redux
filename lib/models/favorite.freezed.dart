// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FavoriteStatusTearOff {
  const _$FavoriteStatusTearOff();

  _FavoriteStatus call({@required int favorite, @required String note}) {
    return _FavoriteStatus(
      favorite: favorite,
      note: note,
    );
  }
}

// ignore: unused_element
const $FavoriteStatus = _$FavoriteStatusTearOff();

mixin _$FavoriteStatus {
  int get favorite;
  String get note;

  $FavoriteStatusCopyWith<FavoriteStatus> get copyWith;
}

abstract class $FavoriteStatusCopyWith<$Res> {
  factory $FavoriteStatusCopyWith(
          FavoriteStatus value, $Res Function(FavoriteStatus) then) =
      _$FavoriteStatusCopyWithImpl<$Res>;
  $Res call({int favorite, String note});
}

class _$FavoriteStatusCopyWithImpl<$Res>
    implements $FavoriteStatusCopyWith<$Res> {
  _$FavoriteStatusCopyWithImpl(this._value, this._then);

  final FavoriteStatus _value;
  // ignore: unused_field
  final $Res Function(FavoriteStatus) _then;

  @override
  $Res call({
    Object favorite = freezed,
    Object note = freezed,
  }) {
    return _then(_value.copyWith(
      favorite: favorite == freezed ? _value.favorite : favorite as int,
      note: note == freezed ? _value.note : note as String,
    ));
  }
}

abstract class _$FavoriteStatusCopyWith<$Res>
    implements $FavoriteStatusCopyWith<$Res> {
  factory _$FavoriteStatusCopyWith(
          _FavoriteStatus value, $Res Function(_FavoriteStatus) then) =
      __$FavoriteStatusCopyWithImpl<$Res>;
  @override
  $Res call({int favorite, String note});
}

class __$FavoriteStatusCopyWithImpl<$Res>
    extends _$FavoriteStatusCopyWithImpl<$Res>
    implements _$FavoriteStatusCopyWith<$Res> {
  __$FavoriteStatusCopyWithImpl(
      _FavoriteStatus _value, $Res Function(_FavoriteStatus) _then)
      : super(_value, (v) => _then(v as _FavoriteStatus));

  @override
  _FavoriteStatus get _value => super._value as _FavoriteStatus;

  @override
  $Res call({
    Object favorite = freezed,
    Object note = freezed,
  }) {
    return _then(_FavoriteStatus(
      favorite: favorite == freezed ? _value.favorite : favorite as int,
      note: note == freezed ? _value.note : note as String,
    ));
  }
}

class _$_FavoriteStatus implements _FavoriteStatus {
  const _$_FavoriteStatus({@required this.favorite, @required this.note})
      : assert(favorite != null),
        assert(note != null);

  @override
  final int favorite;
  @override
  final String note;

  @override
  String toString() {
    return 'FavoriteStatus(favorite: $favorite, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavoriteStatus &&
            (identical(other.favorite, favorite) ||
                const DeepCollectionEquality()
                    .equals(other.favorite, favorite)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favorite) ^
      const DeepCollectionEquality().hash(note);

  @override
  _$FavoriteStatusCopyWith<_FavoriteStatus> get copyWith =>
      __$FavoriteStatusCopyWithImpl<_FavoriteStatus>(this, _$identity);
}

abstract class _FavoriteStatus implements FavoriteStatus {
  const factory _FavoriteStatus(
      {@required int favorite, @required String note}) = _$_FavoriteStatus;

  @override
  int get favorite;
  @override
  String get note;
  @override
  _$FavoriteStatusCopyWith<_FavoriteStatus> get copyWith;
}
