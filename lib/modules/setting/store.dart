import 'package:enum_to_string/enum_to_string.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'enum_adapter.dart';
import 'types.dart';

const _parse = EnumToString.parse;

class SettingStore {
  SettingStore(StreamingSharedPreferences prefs)
      : displayJapaneseTitle = prefs.getBool(
            _parse(SettingKey.displayJapaneseTitle),
            defaultValue: false),
        orientation = prefs.getCustomValue<OrientationSetting>(
            _parse(SettingKey.orientation),
            defaultValue: OrientationSetting.auto,
            adapter: const EnumAdapter(OrientationSetting.values)),
        turnPagesWithVolumeKeys = prefs.getBool(
            _parse(SettingKey.turnPagesWithVolumeKeys),
            defaultValue: false),
        theme = prefs.getCustomValue(_parse(SettingKey.theme),
            defaultValue: ThemeSetting.system,
            adapter: const EnumAdapter(ThemeSetting.values)),
        displayContentWarning = prefs.getBool(
            _parse(SettingKey.displayContentWarning),
            defaultValue: true);

  final Preference<bool> displayJapaneseTitle;
  final Preference<OrientationSetting> orientation;
  final Preference<bool> turnPagesWithVolumeKeys;
  final Preference<ThemeSetting> theme;
  final Preference<bool> displayContentWarning;
}
