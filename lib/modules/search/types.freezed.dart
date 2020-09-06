// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchArgumentsTearOff {
  const _$SearchArgumentsTearOff();

// ignore: unused_element
  _SearchArguments call({String query = ''}) {
    return _SearchArguments(
      query: query,
    );
  }
}

// ignore: unused_element
const $SearchArguments = _$SearchArgumentsTearOff();

mixin _$SearchArguments {
  String get query;

  $SearchArgumentsCopyWith<SearchArguments> get copyWith;
}

abstract class $SearchArgumentsCopyWith<$Res> {
  factory $SearchArgumentsCopyWith(
          SearchArguments value, $Res Function(SearchArguments) then) =
      _$SearchArgumentsCopyWithImpl<$Res>;
  $Res call({String query});
}

class _$SearchArgumentsCopyWithImpl<$Res>
    implements $SearchArgumentsCopyWith<$Res> {
  _$SearchArgumentsCopyWithImpl(this._value, this._then);

  final SearchArguments _value;
  // ignore: unused_field
  final $Res Function(SearchArguments) _then;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed ? _value.query : query as String,
    ));
  }
}

abstract class _$SearchArgumentsCopyWith<$Res>
    implements $SearchArgumentsCopyWith<$Res> {
  factory _$SearchArgumentsCopyWith(
          _SearchArguments value, $Res Function(_SearchArguments) then) =
      __$SearchArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({String query});
}

class __$SearchArgumentsCopyWithImpl<$Res>
    extends _$SearchArgumentsCopyWithImpl<$Res>
    implements _$SearchArgumentsCopyWith<$Res> {
  __$SearchArgumentsCopyWithImpl(
      _SearchArguments _value, $Res Function(_SearchArguments) _then)
      : super(_value, (v) => _then(v as _SearchArguments));

  @override
  _SearchArguments get _value => super._value as _SearchArguments;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_SearchArguments(
      query: query == freezed ? _value.query : query as String,
    ));
  }
}

class _$_SearchArguments implements _SearchArguments {
  const _$_SearchArguments({this.query = ''}) : assert(query != null);

  @JsonKey(defaultValue: '')
  @override
  final String query;

  @override
  String toString() {
    return 'SearchArguments(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchArguments &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @override
  _$SearchArgumentsCopyWith<_SearchArguments> get copyWith =>
      __$SearchArgumentsCopyWithImpl<_SearchArguments>(this, _$identity);
}

abstract class _SearchArguments implements SearchArguments {
  const factory _SearchArguments({String query}) = _$_SearchArguments;

  @override
  String get query;
  @override
  _$SearchArgumentsCopyWith<_SearchArguments> get copyWith;
}
