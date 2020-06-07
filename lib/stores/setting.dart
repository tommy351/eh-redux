import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting.g.dart';

class SettingStore = _SettingStoreBase with _$SettingStore;

abstract class _SettingStoreBase with Store {
  final SharedPreferences sharedPreferences;

  _SettingStoreBase({
    @required this.sharedPreferences,
  }) : assert(sharedPreferences != null);
}
