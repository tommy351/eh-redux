// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaginationTearOff {
  const _$PaginationTearOff();

  _Pagination<T> call<T>(
      {@required BuiltSet<T> index,
      bool loading = false,
      bool noMore = false,
      int currentPage = -1}) {
    return _Pagination<T>(
      index: index,
      loading: loading,
      noMore: noMore,
      currentPage: currentPage,
    );
  }
}

// ignore: unused_element
const $Pagination = _$PaginationTearOff();

mixin _$Pagination<T> {
  BuiltSet<T> get index;
  bool get loading;
  bool get noMore;
  int get currentPage;

  $PaginationCopyWith<T, Pagination<T>> get copyWith;
}

abstract class $PaginationCopyWith<T, $Res> {
  factory $PaginationCopyWith(
          Pagination<T> value, $Res Function(Pagination<T>) then) =
      _$PaginationCopyWithImpl<T, $Res>;
  $Res call({BuiltSet<T> index, bool loading, bool noMore, int currentPage});
}

class _$PaginationCopyWithImpl<T, $Res>
    implements $PaginationCopyWith<T, $Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  final Pagination<T> _value;
  // ignore: unused_field
  final $Res Function(Pagination<T>) _then;

  @override
  $Res call({
    Object index = freezed,
    Object loading = freezed,
    Object noMore = freezed,
    Object currentPage = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed ? _value.index : index as BuiltSet<T>,
      loading: loading == freezed ? _value.loading : loading as bool,
      noMore: noMore == freezed ? _value.noMore : noMore as bool,
      currentPage:
          currentPage == freezed ? _value.currentPage : currentPage as int,
    ));
  }
}

abstract class _$PaginationCopyWith<T, $Res>
    implements $PaginationCopyWith<T, $Res> {
  factory _$PaginationCopyWith(
          _Pagination<T> value, $Res Function(_Pagination<T>) then) =
      __$PaginationCopyWithImpl<T, $Res>;
  @override
  $Res call({BuiltSet<T> index, bool loading, bool noMore, int currentPage});
}

class __$PaginationCopyWithImpl<T, $Res>
    extends _$PaginationCopyWithImpl<T, $Res>
    implements _$PaginationCopyWith<T, $Res> {
  __$PaginationCopyWithImpl(
      _Pagination<T> _value, $Res Function(_Pagination<T>) _then)
      : super(_value, (v) => _then(v as _Pagination<T>));

  @override
  _Pagination<T> get _value => super._value as _Pagination<T>;

  @override
  $Res call({
    Object index = freezed,
    Object loading = freezed,
    Object noMore = freezed,
    Object currentPage = freezed,
  }) {
    return _then(_Pagination<T>(
      index: index == freezed ? _value.index : index as BuiltSet<T>,
      loading: loading == freezed ? _value.loading : loading as bool,
      noMore: noMore == freezed ? _value.noMore : noMore as bool,
      currentPage:
          currentPage == freezed ? _value.currentPage : currentPage as int,
    ));
  }
}

class _$_Pagination<T> implements _Pagination<T> {
  const _$_Pagination(
      {@required this.index,
      this.loading = false,
      this.noMore = false,
      this.currentPage = -1})
      : assert(index != null),
        assert(loading != null),
        assert(noMore != null),
        assert(currentPage != null);

  @override
  final BuiltSet<T> index;
  @JsonKey(defaultValue: false)
  @override
  final bool loading;
  @JsonKey(defaultValue: false)
  @override
  final bool noMore;
  @JsonKey(defaultValue: -1)
  @override
  final int currentPage;

  @override
  String toString() {
    return 'Pagination<$T>(index: $index, loading: $loading, noMore: $noMore, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pagination<T> &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.noMore, noMore) ||
                const DeepCollectionEquality().equals(other.noMore, noMore)) &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(noMore) ^
      const DeepCollectionEquality().hash(currentPage);

  @override
  _$PaginationCopyWith<T, _Pagination<T>> get copyWith =>
      __$PaginationCopyWithImpl<T, _Pagination<T>>(this, _$identity);
}

abstract class _Pagination<T> implements Pagination<T> {
  const factory _Pagination(
      {@required BuiltSet<T> index,
      bool loading,
      bool noMore,
      int currentPage}) = _$_Pagination<T>;

  @override
  BuiltSet<T> get index;
  @override
  bool get loading;
  @override
  bool get noMore;
  @override
  int get currentPage;
  @override
  _$PaginationCopyWith<T, _Pagination<T>> get copyWith;
}
