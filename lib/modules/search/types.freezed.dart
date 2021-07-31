// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchArgumentsTearOff {
  const _$SearchArgumentsTearOff();

  _SearchArguments call({String query = ''}) {
    return _SearchArguments(
      query: query,
    );
  }
}

/// @nodoc
const $SearchArguments = _$SearchArgumentsTearOff();

/// @nodoc
mixin _$SearchArguments {
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchArgumentsCopyWith<SearchArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchArgumentsCopyWith<$Res> {
  factory $SearchArgumentsCopyWith(
          SearchArguments value, $Res Function(SearchArguments) then) =
      _$SearchArgumentsCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class _$SearchArgumentsCopyWithImpl<$Res>
    implements $SearchArgumentsCopyWith<$Res> {
  _$SearchArgumentsCopyWithImpl(this._value, this._then);

  final SearchArguments _value;
  // ignore: unused_field
  final $Res Function(SearchArguments) _then;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchArgumentsCopyWith<$Res>
    implements $SearchArgumentsCopyWith<$Res> {
  factory _$SearchArgumentsCopyWith(
          _SearchArguments value, $Res Function(_SearchArguments) then) =
      __$SearchArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({String query});
}

/// @nodoc
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
    Object? query = freezed,
  }) {
    return _then(_SearchArguments(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchArguments implements _SearchArguments {
  const _$_SearchArguments({this.query = ''});

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

  @JsonKey(ignore: true)
  @override
  _$SearchArgumentsCopyWith<_SearchArguments> get copyWith =>
      __$SearchArgumentsCopyWithImpl<_SearchArguments>(this, _$identity);
}

abstract class _SearchArguments implements SearchArguments {
  const factory _SearchArguments({String query}) = _$_SearchArguments;

  @override
  String get query => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchArgumentsCopyWith<_SearchArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
