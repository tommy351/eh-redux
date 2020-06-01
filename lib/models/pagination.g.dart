// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pagination<Object>> _$paginationSerializer =
    new _$PaginationSerializer();

class _$PaginationSerializer
    implements StructuredSerializer<Pagination<Object>> {
  @override
  final Iterable<Type> types = const [Pagination, _$Pagination];
  @override
  final String wireName = 'Pagination';

  @override
  Iterable<Object> serialize(Serializers serializers, Pagination<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'index',
      serializers.serialize(object.index,
          specifiedType: new FullType(BuiltSet, [parameterT])),
      'loading',
      serializers.serialize(object.loading,
          specifiedType: const FullType(bool)),
      'noMore',
      serializers.serialize(object.noMore, specifiedType: const FullType(bool)),
      'currentPage',
      serializers.serialize(object.currentPage,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Pagination<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new PaginationBuilder<Object>()
        : serializers.newBuilder(specifiedType) as PaginationBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
                  specifiedType: new FullType(BuiltSet, [parameterT]))
              as BuiltSet<Object>;
          break;
        case 'loading':
          result.loading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'noMore':
          result.noMore = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'currentPage':
          result.currentPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Pagination<T> extends Pagination<T> {
  @override
  final BuiltSet<T> index;
  @override
  final bool loading;
  @override
  final bool noMore;
  @override
  final int currentPage;

  factory _$Pagination([void Function(PaginationBuilder<T>) updates]) =>
      (new PaginationBuilder<T>()..update(updates)).build() as _$Pagination<T>;

  _$Pagination._({this.index, this.loading, this.noMore, this.currentPage})
      : super._() {
    if (index == null) {
      throw new BuiltValueNullFieldError('Pagination', 'index');
    }
    if (loading == null) {
      throw new BuiltValueNullFieldError('Pagination', 'loading');
    }
    if (noMore == null) {
      throw new BuiltValueNullFieldError('Pagination', 'noMore');
    }
    if (currentPage == null) {
      throw new BuiltValueNullFieldError('Pagination', 'currentPage');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('Pagination', 'T');
    }
  }

  @override
  Pagination<T> rebuild(void Function(PaginationBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$PaginationBuilder<T> toBuilder() =>
      new _$PaginationBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pagination &&
        index == other.index &&
        loading == other.loading &&
        noMore == other.noMore &&
        currentPage == other.currentPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, index.hashCode), loading.hashCode), noMore.hashCode),
        currentPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pagination')
          ..add('index', index)
          ..add('loading', loading)
          ..add('noMore', noMore)
          ..add('currentPage', currentPage))
        .toString();
  }
}

class _$PaginationBuilder<T> extends PaginationBuilder<T> {
  _$Pagination<T> _$v;

  @override
  BuiltSet<T> get index {
    _$this;
    return super.index;
  }

  @override
  set index(BuiltSet<T> index) {
    _$this;
    super.index = index;
  }

  @override
  bool get loading {
    _$this;
    return super.loading;
  }

  @override
  set loading(bool loading) {
    _$this;
    super.loading = loading;
  }

  @override
  bool get noMore {
    _$this;
    return super.noMore;
  }

  @override
  set noMore(bool noMore) {
    _$this;
    super.noMore = noMore;
  }

  @override
  int get currentPage {
    _$this;
    return super.currentPage;
  }

  @override
  set currentPage(int currentPage) {
    _$this;
    super.currentPage = currentPage;
  }

  _$PaginationBuilder() : super._();

  PaginationBuilder<T> get _$this {
    if (_$v != null) {
      super.index = _$v.index;
      super.loading = _$v.loading;
      super.noMore = _$v.noMore;
      super.currentPage = _$v.currentPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pagination<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pagination<T>;
  }

  @override
  void update(void Function(PaginationBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pagination<T> build() {
    final _$result = _$v ??
        new _$Pagination<T>._(
            index: index,
            loading: loading,
            noMore: noMore,
            currentPage: currentPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
