// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'args.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ViewScreenArguments> _$viewScreenArgumentsSerializer =
    new _$ViewScreenArgumentsSerializer();

class _$ViewScreenArgumentsSerializer
    implements StructuredSerializer<ViewScreenArguments> {
  @override
  final Iterable<Type> types = const [
    ViewScreenArguments,
    _$ViewScreenArguments
  ];
  @override
  final String wireName = 'ViewScreenArguments';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ViewScreenArguments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(GalleryId)),
    ];

    return result;
  }

  @override
  ViewScreenArguments deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ViewScreenArgumentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(GalleryId)) as GalleryId);
          break;
      }
    }

    return result.build();
  }
}

class _$ViewScreenArguments extends ViewScreenArguments {
  @override
  final GalleryId id;

  factory _$ViewScreenArguments(
          [void Function(ViewScreenArgumentsBuilder) updates]) =>
      (new ViewScreenArgumentsBuilder()..update(updates)).build();

  _$ViewScreenArguments._({this.id}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ViewScreenArguments', 'id');
    }
  }

  @override
  ViewScreenArguments rebuild(
          void Function(ViewScreenArgumentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ViewScreenArgumentsBuilder toBuilder() =>
      new ViewScreenArgumentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ViewScreenArguments && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ViewScreenArguments')..add('id', id))
        .toString();
  }
}

class ViewScreenArgumentsBuilder
    implements Builder<ViewScreenArguments, ViewScreenArgumentsBuilder> {
  _$ViewScreenArguments _$v;

  GalleryIdBuilder _id;
  GalleryIdBuilder get id => _$this._id ??= new GalleryIdBuilder();
  set id(GalleryIdBuilder id) => _$this._id = id;

  ViewScreenArgumentsBuilder();

  ViewScreenArgumentsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ViewScreenArguments other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ViewScreenArguments;
  }

  @override
  void update(void Function(ViewScreenArgumentsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ViewScreenArguments build() {
    _$ViewScreenArguments _$result;
    try {
      _$result = _$v ?? new _$ViewScreenArguments._(id: id.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'id';
        id.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ViewScreenArguments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
