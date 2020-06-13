// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteStatus> _$favoriteStatusSerializer =
    new _$FavoriteStatusSerializer();

class _$FavoriteStatusSerializer
    implements StructuredSerializer<FavoriteStatus> {
  @override
  final Iterable<Type> types = const [FavoriteStatus, _$FavoriteStatus];
  @override
  final String wireName = 'FavoriteStatus';

  @override
  Iterable<Object> serialize(Serializers serializers, FavoriteStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'favorite',
      serializers.serialize(object.favorite,
          specifiedType: const FullType(int)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FavoriteStatus deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FavoriteStatus extends FavoriteStatus {
  @override
  final int favorite;
  @override
  final String note;

  factory _$FavoriteStatus([void Function(FavoriteStatusBuilder) updates]) =>
      (new FavoriteStatusBuilder()..update(updates)).build();

  _$FavoriteStatus._({this.favorite, this.note}) : super._() {
    if (favorite == null) {
      throw new BuiltValueNullFieldError('FavoriteStatus', 'favorite');
    }
    if (note == null) {
      throw new BuiltValueNullFieldError('FavoriteStatus', 'note');
    }
  }

  @override
  FavoriteStatus rebuild(void Function(FavoriteStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteStatusBuilder toBuilder() =>
      new FavoriteStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteStatus &&
        favorite == other.favorite &&
        note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, favorite.hashCode), note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavoriteStatus')
          ..add('favorite', favorite)
          ..add('note', note))
        .toString();
  }
}

class FavoriteStatusBuilder
    implements Builder<FavoriteStatus, FavoriteStatusBuilder> {
  _$FavoriteStatus _$v;

  int _favorite;
  int get favorite => _$this._favorite;
  set favorite(int favorite) => _$this._favorite = favorite;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  FavoriteStatusBuilder();

  FavoriteStatusBuilder get _$this {
    if (_$v != null) {
      _favorite = _$v.favorite;
      _note = _$v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteStatus other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FavoriteStatus;
  }

  @override
  void update(void Function(FavoriteStatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FavoriteStatus build() {
    final _$result =
        _$v ?? new _$FavoriteStatus._(favorite: favorite, note: note);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
