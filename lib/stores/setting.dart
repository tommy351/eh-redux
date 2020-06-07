import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting.g.dart';

class SettingKey extends EnumClass {
  static Serializer<SettingKey> get serializer => _$settingKeySerializer;

  static const SettingKey displayJapaneseTitle = _$displayJapaneseTitle;

  const SettingKey._(String name) : super(name);

  static BuiltSet<SettingKey> get values => _$values;
  static SettingKey valueOf(String name) => _$valueOf(name);
}

class SettingStore = _SettingStoreBase with _$SettingStore;

abstract class _SettingStoreBase with Store {
  @observable
  ObservableFuture<bool> displayJapaneseTitle;

  Future<SharedPreferences> _prefs;

  _SettingStoreBase() {
    _prefs = SharedPreferences.getInstance();
    displayJapaneseTitle = _getValue<bool>(SettingKey.displayJapaneseTitle);
  }

  @action
  // ignore: avoid_positional_boolean_parameters
  Future<void> setDisplayJapaneseTitle(bool value) async {
    displayJapaneseTitle = _setBool(SettingKey.displayJapaneseTitle, value);
  }

  ObservableFuture<T> _getValue<T>(SettingKey key) {
    return ObservableFuture(
        _prefs.then((prefs) => prefs.get(key.toString()) as T));
  }

  ObservableFuture<bool> _setBool(SettingKey key, bool value) {
    return ObservableFuture(
        _prefs.then((prefs) => prefs.setBool(key.toString(), value)));
  }
}
