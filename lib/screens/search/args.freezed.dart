// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchScreenArgumentsTearOff {
  const _$SearchScreenArgumentsTearOff();

  _SearchScreenArguments call({String query = ''}) {
    return _SearchScreenArguments(
      query: query,
    );
  }
}

// ignore: unused_element
const $SearchScreenArguments = _$SearchScreenArgumentsTearOff();

mixin _$SearchScreenArguments {
  String get query;

  $SearchScreenArgumentsCopyWith<SearchScreenArguments> get copyWith;
}

abstract class $SearchScreenArgumentsCopyWith<$Res> {
  factory $SearchScreenArgumentsCopyWith(SearchScreenArguments value,
          $Res Function(SearchScreenArguments) then) =
      _$SearchScreenArgumentsCopyWithImpl<$Res>;
  $Res call({String query});
}

class _$SearchScreenArgumentsCopyWithImpl<$Res>
    implements $SearchScreenArgumentsCopyWith<$Res> {
  _$SearchScreenArgumentsCopyWithImpl(this._value, this._then);

  final SearchScreenArguments _value;
  // ignore: unused_field
  final $Res Function(SearchScreenArguments) _then;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed ? _value.query : query as String,
    ));
  }
}

abstract class _$SearchScreenArgumentsCopyWith<$Res>
    implements $SearchScreenArgumentsCopyWith<$Res> {
  factory _$SearchScreenArgumentsCopyWith(_SearchScreenArguments value,
          $Res Function(_SearchScreenArguments) then) =
      __$SearchScreenArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({String query});
}

class __$SearchScreenArgumentsCopyWithImpl<$Res>
    extends _$SearchScreenArgumentsCopyWithImpl<$Res>
    implements _$SearchScreenArgumentsCopyWith<$Res> {
  __$SearchScreenArgumentsCopyWithImpl(_SearchScreenArguments _value,
      $Res Function(_SearchScreenArguments) _then)
      : super(_value, (v) => _then(v as _SearchScreenArguments));

  @override
  _SearchScreenArguments get _value => super._value as _SearchScreenArguments;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_SearchScreenArguments(
      query: query == freezed ? _value.query : query as String,
    ));
  }
}

class _$_SearchScreenArguments implements _SearchScreenArguments {
  const _$_SearchScreenArguments({this.query = ''}) : assert(query != null);

  @JsonKey(defaultValue: '')
  @override
  final String query;

  @override
  String toString() {
    return 'SearchScreenArguments(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchScreenArguments &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @override
  _$SearchScreenArgumentsCopyWith<_SearchScreenArguments> get copyWith =>
      __$SearchScreenArgumentsCopyWithImpl<_SearchScreenArguments>(
          this, _$identity);
}

abstract class _SearchScreenArguments implements SearchScreenArguments {
  const factory _SearchScreenArguments({String query}) =
      _$_SearchScreenArguments;

  @override
  String get query;
  @override
  _$SearchScreenArgumentsCopyWith<_SearchScreenArguments> get copyWith;
}
