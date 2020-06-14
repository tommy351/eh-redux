// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const OrientationSetting _$auto = const OrientationSetting._('auto');
const OrientationSetting _$landscape = const OrientationSetting._('landscape');
const OrientationSetting _$portrait = const OrientationSetting._('portrait');

OrientationSetting _$orientationSettingValueOf(String name) {
  switch (name) {
    case 'auto':
      return _$auto;
    case 'landscape':
      return _$landscape;
    case 'portrait':
      return _$portrait;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OrientationSetting> _$orientationSettingValues =
    new BuiltSet<OrientationSetting>(const <OrientationSetting>[
  _$auto,
  _$landscape,
  _$portrait,
]);

const SettingKey _$displayJapaneseTitle =
    const SettingKey._('displayJapaneseTitle');
const SettingKey _$orientation = const SettingKey._('orientation');
const SettingKey _$turnPagesWithVolumeKeys =
    const SettingKey._('turnPagesWithVolumeKeys');

SettingKey _$valueOf(String name) {
  switch (name) {
    case 'displayJapaneseTitle':
      return _$displayJapaneseTitle;
    case 'orientation':
      return _$orientation;
    case 'turnPagesWithVolumeKeys':
      return _$turnPagesWithVolumeKeys;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SettingKey> _$values =
    new BuiltSet<SettingKey>(const <SettingKey>[
  _$displayJapaneseTitle,
  _$orientation,
  _$turnPagesWithVolumeKeys,
]);

Serializer<OrientationSetting> _$orientationSettingSerializer =
    new _$OrientationSettingSerializer();
Serializer<SettingKey> _$settingKeySerializer = new _$SettingKeySerializer();

class _$OrientationSettingSerializer
    implements PrimitiveSerializer<OrientationSetting> {
  @override
  final Iterable<Type> types = const <Type>[OrientationSetting];
  @override
  final String wireName = 'OrientationSetting';

  @override
  Object serialize(Serializers serializers, OrientationSetting object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  OrientationSetting deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      OrientationSetting.valueOf(serialized as String);
}

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

  final _$orientationAtom = Atom(name: '_SettingStoreBase.orientation');

  @override
  ObservableFuture<OrientationSetting> get orientation {
    _$orientationAtom.reportRead();
    return super.orientation;
  }

  @override
  set orientation(ObservableFuture<OrientationSetting> value) {
    _$orientationAtom.reportWrite(value, super.orientation, () {
      super.orientation = value;
    });
  }

  final _$turnPagesWithVolumeKeysAtom =
      Atom(name: '_SettingStoreBase.turnPagesWithVolumeKeys');

  @override
  ObservableFuture<bool> get turnPagesWithVolumeKeys {
    _$turnPagesWithVolumeKeysAtom.reportRead();
    return super.turnPagesWithVolumeKeys;
  }

  @override
  set turnPagesWithVolumeKeys(ObservableFuture<bool> value) {
    _$turnPagesWithVolumeKeysAtom
        .reportWrite(value, super.turnPagesWithVolumeKeys, () {
      super.turnPagesWithVolumeKeys = value;
    });
  }

  final _$setDisplayJapaneseTitleAsyncAction =
      AsyncAction('_SettingStoreBase.setDisplayJapaneseTitle');

  @override
  Future<void> setDisplayJapaneseTitle(bool value) {
    return _$setDisplayJapaneseTitleAsyncAction
        .run(() => super.setDisplayJapaneseTitle(value));
  }

  final _$setOrientationAsyncAction =
      AsyncAction('_SettingStoreBase.setOrientation');

  @override
  Future<void> setOrientation(OrientationSetting value) {
    return _$setOrientationAsyncAction.run(() => super.setOrientation(value));
  }

  final _$setTurnPagesWithVolumeKeysAsyncAction =
      AsyncAction('_SettingStoreBase.setTurnPagesWithVolumeKeys');

  @override
  Future<void> setTurnPagesWithVolumeKeys(bool value) {
    return _$setTurnPagesWithVolumeKeysAsyncAction
        .run(() => super.setTurnPagesWithVolumeKeys(value));
  }

  @override
  String toString() {
    return '''
displayJapaneseTitle: ${displayJapaneseTitle},
orientation: ${orientation},
turnPagesWithVolumeKeys: ${turnPagesWithVolumeKeys}
    ''';
  }
}
