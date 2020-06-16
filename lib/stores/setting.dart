import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting.g.dart';

class OrientationSetting extends EnumClass {
  const OrientationSetting._(String name) : super(name);

  static Serializer<OrientationSetting> get serializer =>
      _$orientationSettingSerializer;

  static const OrientationSetting auto = _$auto;
  static const OrientationSetting landscape = _$landscape;
  static const OrientationSetting portrait = _$portrait;

  static BuiltSet<OrientationSetting> get values => _$orientationSettingValues;
  static OrientationSetting valueOf(String name) =>
      _$orientationSettingValueOf(name);
}

class ThemeSetting extends EnumClass {
  const ThemeSetting._(String name) : super(name);

  static Serializer<ThemeSetting> get serializer => _$themeSettingSerializer;

  static const ThemeSetting system = _$system;
  static const ThemeSetting light = _$light;
  static const ThemeSetting dark = _$dark;
  static const ThemeSetting black = _$black;

  static BuiltSet<ThemeSetting> get values => _$themeSettingValues;
  static ThemeSetting valueOf(String name) => _$themeSettingValueOf(name);
}

class SettingKey extends EnumClass {
  const SettingKey._(String name) : super(name);

  static Serializer<SettingKey> get serializer => _$settingKeySerializer;

  static const SettingKey displayJapaneseTitle = _$displayJapaneseTitle;
  static const SettingKey orientation = _$orientation;
  static const SettingKey turnPagesWithVolumeKeys = _$turnPagesWithVolumeKeys;
  static const SettingKey theme = _$theme;

  static BuiltSet<SettingKey> get values => _$values;
  static SettingKey valueOf(String name) => _$valueOf(name);
}

class SettingStore = _SettingStoreBase with _$SettingStore;

abstract class _SettingStoreBase with Store {
  _SettingStoreBase() {
    _prefs = SharedPreferences.getInstance();
    displayJapaneseTitle =
        _getValue<bool>(SettingKey.displayJapaneseTitle, false);
    orientation = _getValue<String>(
            SettingKey.orientation, OrientationSetting.auto.toString())
        .then((value) => OrientationSetting.valueOf(value));
    turnPagesWithVolumeKeys =
        _getValue<bool>(SettingKey.turnPagesWithVolumeKeys, false);
    theme = _getValue<String>(SettingKey.theme, ThemeSetting.system.toString())
        .then((value) => ThemeSetting.valueOf(value));
  }

  @observable
  ObservableFuture<bool> displayJapaneseTitle;

  @observable
  ObservableFuture<OrientationSetting> orientation;

  @observable
  ObservableFuture<bool> turnPagesWithVolumeKeys;

  @observable
  ObservableFuture<ThemeSetting> theme;

  Future<SharedPreferences> _prefs;

  @action
  // ignore: avoid_positional_boolean_parameters
  Future<void> setDisplayJapaneseTitle(bool value) async {
    await _setBool(SettingKey.displayJapaneseTitle, value);
    displayJapaneseTitle = ObservableFuture.value(value);
  }

  @action
  Future<void> setOrientation(OrientationSetting value) async {
    await _setString(SettingKey.orientation, value.toString());
    orientation = ObservableFuture.value(value);
  }

  @action
  // ignore: avoid_positional_boolean_parameters
  Future<void> setTurnPagesWithVolumeKeys(bool value) async {
    await _setBool(SettingKey.turnPagesWithVolumeKeys, value);
    turnPagesWithVolumeKeys = ObservableFuture.value(value);
  }

  @action
  Future<void> setTheme(ThemeSetting value) async {
    await _setString(SettingKey.theme, value.toString());
    theme = ObservableFuture.value(value);
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
