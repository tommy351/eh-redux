// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'args.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchScreenArguments> _$searchScreenArgumentsSerializer =
    new _$SearchScreenArgumentsSerializer();

class _$SearchScreenArgumentsSerializer
    implements StructuredSerializer<SearchScreenArguments> {
  @override
  final Iterable<Type> types = const [
    SearchScreenArguments,
    _$SearchScreenArguments
  ];
  @override
  final String wireName = 'SearchScreenArguments';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SearchScreenArguments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SearchScreenArguments deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchScreenArgumentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchScreenArguments extends SearchScreenArguments {
  @override
  final String query;

  factory _$SearchScreenArguments(
          [void Function(SearchScreenArgumentsBuilder) updates]) =>
      (new SearchScreenArgumentsBuilder()..update(updates)).build()
          as _$SearchScreenArguments;

  _$SearchScreenArguments._({this.query}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('SearchScreenArguments', 'query');
    }
  }

  @override
  SearchScreenArguments rebuild(
          void Function(SearchScreenArgumentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$SearchScreenArgumentsBuilder toBuilder() =>
      new _$SearchScreenArgumentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchScreenArguments && query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(0, query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchScreenArguments')
          ..add('query', query))
        .toString();
  }
}

class _$SearchScreenArgumentsBuilder extends SearchScreenArgumentsBuilder {
  _$SearchScreenArguments _$v;

  @override
  String get query {
    _$this;
    return super.query;
  }

  @override
  set query(String query) {
    _$this;
    super.query = query;
  }

  _$SearchScreenArgumentsBuilder() : super._();

  SearchScreenArgumentsBuilder get _$this {
    if (_$v != null) {
      super.query = _$v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchScreenArguments other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchScreenArguments;
  }

  @override
  void update(void Function(SearchScreenArgumentsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchScreenArguments build() {
    final _$result = _$v ?? new _$SearchScreenArguments._(query: query);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
