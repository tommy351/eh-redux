// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'args.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GalleryScreenArguments> _$galleryScreenArgumentsSerializer =
    new _$GalleryScreenArgumentsSerializer();

class _$GalleryScreenArgumentsSerializer
    implements StructuredSerializer<GalleryScreenArguments> {
  @override
  final Iterable<Type> types = const [
    GalleryScreenArguments,
    _$GalleryScreenArguments
  ];
  @override
  final String wireName = 'GalleryScreenArguments';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GalleryScreenArguments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(GalleryId)),
    ];

    return result;
  }

  @override
  GalleryScreenArguments deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryScreenArgumentsBuilder();

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

class _$GalleryScreenArguments extends GalleryScreenArguments {
  @override
  final GalleryId id;

  factory _$GalleryScreenArguments(
          [void Function(GalleryScreenArgumentsBuilder) updates]) =>
      (new GalleryScreenArgumentsBuilder()..update(updates)).build();

  _$GalleryScreenArguments._({this.id}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('GalleryScreenArguments', 'id');
    }
  }

  @override
  GalleryScreenArguments rebuild(
          void Function(GalleryScreenArgumentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryScreenArgumentsBuilder toBuilder() =>
      new GalleryScreenArgumentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryScreenArguments && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryScreenArguments')
          ..add('id', id))
        .toString();
  }
}

class GalleryScreenArgumentsBuilder
    implements Builder<GalleryScreenArguments, GalleryScreenArgumentsBuilder> {
  _$GalleryScreenArguments _$v;

  GalleryIdBuilder _id;
  GalleryIdBuilder get id => _$this._id ??= new GalleryIdBuilder();
  set id(GalleryIdBuilder id) => _$this._id = id;

  GalleryScreenArgumentsBuilder();

  GalleryScreenArgumentsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryScreenArguments other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryScreenArguments;
  }

  @override
  void update(void Function(GalleryScreenArgumentsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryScreenArguments build() {
    _$GalleryScreenArguments _$result;
    try {
      _$result = _$v ?? new _$GalleryScreenArguments._(id: id.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'id';
        id.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GalleryScreenArguments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
