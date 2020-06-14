import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting.g.dart';

class OrientationSetting extends EnumClass {
  static Serializer<OrientationSetting> get serializer =>
      _$orientationSettingSerializer;

  static const OrientationSetting auto = _$auto;
  static const OrientationSetting landscape = _$landscape;
  static const OrientationSetting portrait = _$portrait;

  const OrientationSetting._(String name) : super(name);

  static BuiltSet<OrientationSetting> get values => _$orientationSettingValues;
  static OrientationSetting valueOf(String name) =>
      _$orientationSettingValueOf(name);
}

class SettingKey extends EnumClass {
  static Serializer<SettingKey> get serializer => _$settingKeySerializer;

  static const SettingKey displayJapaneseTitle = _$displayJapaneseTitle;
  static const SettingKey orientation = _$orientation;
  static const SettingKey turnPagesWithVolumeKeys = _$turnPagesWithVolumeKeys;

  const SettingKey._(String name) : super(name);

  static BuiltSet<SettingKey> get values => _$values;
  static SettingKey valueOf(String name) => _$valueOf(name);
}

class SettingStore = _SettingStoreBase with _$SettingStore;

abstract class _SettingStoreBase with Store {
  @observable
  ObservableFuture<bool> displayJapaneseTitle;

  @observable
  ObservableFuture<OrientationSetting> orientation;

  @observable
  ObservableFuture<bool> turnPagesWithVolumeKeys;

  Future<SharedPreferences> _prefs;

  _SettingStoreBase() {
    _prefs = SharedPreferences.getInstance();
    displayJapaneseTitle =
        _getValue<bool>(SettingKey.displayJapaneseTitle, false);
    orientation = _getValue<String>(
            SettingKey.orientation, OrientationSetting.auto.toString())
        .then((value) => OrientationSetting.valueOf(value));
    turnPagesWithVolumeKeys =
        _getValue<bool>(SettingKey.turnPagesWithVolumeKeys, false);
  }

  @action
  // ignore: avoid_positional_boolean_parameters
  Future<void> setDisplayJapaneseTitle(bool value) async {
    return displayJapaneseTitle =
        _setBool(SettingKey.displayJapaneseTitle, value).then((_) => value);
  }

  @action
  Future<void> setOrientation(OrientationSetting value) async {
    return orientation =
        _setString(SettingKey.orientation, value.toString()).then((_) => value);
  }

  @action
  // ignore: avoid_positional_boolean_parameters
  Future<void> setTurnPagesWithVolumeKeys(bool value) async {
    return turnPagesWithVolumeKeys =
        _setBool(SettingKey.turnPagesWithVolumeKeys, value).then((_) => value);
  }

  ObservableFuture<T> _getValue<T>(SettingKey key, [T defaultValue]) {
    return ObservableFuture(_prefs
        .then((prefs) => prefs.get(key.toString()) as T)
        .then((value) => value ?? defaultValue));
  }

  ObservableFuture<bool> _setBool(SettingKey key, bool value) {
    return ObservableFuture(
        _prefs.then((prefs) => prefs.setBool(key.toString(), value)));
  }

  ObservableFuture<bool> _setString(SettingKey key, String value) {
    return ObservableFuture(
        _prefs.then((prefs) => prefs.setString(key.toString(), value)));
  }
}
