// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SettingKey _$displayJapaneseTitle =
    const SettingKey._('displayJapaneseTitle');

SettingKey _$valueOf(String name) {
  switch (name) {
    case 'displayJapaneseTitle':
      return _$displayJapaneseTitle;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SettingKey> _$values =
    new BuiltSet<SettingKey>(const <SettingKey>[
  _$displayJapaneseTitle,
]);

Serializer<SettingKey> _$settingKeySerializer = new _$SettingKeySerializer();

class _$SettingKeySerializer implements PrimitiveSerializer<SettingKey> {
  @override
  final Iterable<Type> types = const <Type>[SettingKey];
  @override
  final String wireName = 'SettingKey';

  @override
  Object serialize(Serializers serializers, SettingKey object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SettingKey deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SettingKey.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingStore on _SettingStoreBase, Store {
  final _$displayJapaneseTitleAtom =
      Atom(name: '_SettingStoreBase.displayJapaneseTitle');

  @override
  ObservableFuture<bool> get displayJapaneseTitle {
    _$displayJapaneseTitleAtom.reportRead();
    return super.displayJapaneseTitle;
  }

  @override
  set displayJapaneseTitle(ObservableFuture<bool> value) {
    _$displayJapaneseTitleAtom.reportWrite(value, super.displayJapaneseTitle,
        () {
      super.displayJapaneseTitle = value;
    });
  }

  final _$setDisplayJapaneseTitleAsyncAction =
      AsyncAction('_SettingStoreBase.setDisplayJapaneseTitle');

  @override
  Future<void> setDisplayJapaneseTitle(bool value) {
    return _$setDisplayJapaneseTitleAsyncAction
        .run(() => super.setDisplayJapaneseTitle(value));
  }

  @override
  String toString() {
    return '''
displayJapaneseTitle: ${displayJapaneseTitle}
    ''';
  }
}
