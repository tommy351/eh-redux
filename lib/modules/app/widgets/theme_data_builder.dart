import 'package:eh_redux/modules/common/widgets/brightness_observer.dart';
import 'package:eh_redux/modules/setting/store.dart';
import 'package:eh_redux/modules/setting/types.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

part 'theme_data_builder.g.dart';

const _accentColor = Colors.deepOrangeAccent;
final _sliderTheme = SliderThemeData.fromPrimaryColors(
  primaryColor: _accentColor,
  primaryColorDark: _accentColor,
  primaryColorLight: _accentColor,
  valueIndicatorTextStyle: const TextStyle(),
);
final _themeData = <ThemeSetting, ThemeData>{
  ThemeSetting.light: ThemeData(
    primarySwatch: Colors.brown,
    accentColor: _accentColor,
    brightness: Brightness.light,
    sliderTheme: _sliderTheme,
  ),
  ThemeSetting.dark: ThemeData(
    accentColor: _accentColor,
    toggleableActiveColor: _accentColor,
    brightness: Brightness.dark,
    sliderTheme: _sliderTheme,
  ),
  ThemeSetting.black: ThemeData(
    accentColor: _accentColor,
    toggleableActiveColor: _accentColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.grey[800],
    sliderTheme: _sliderTheme,
  ),
};

@swidget
Widget themeDataBuilder(
  BuildContext context, {
  @required Widget Function(BuildContext, ThemeData) builder,
}) {
  final settings = Provider.of<SettingStore>(context);

  return BrightnessObserver(
    builder: (context, brightness) {
      return PreferenceBuilder<ThemeSetting>(
        preference: settings.theme,
        builder: (context, theme) {
          ThemeSetting key = theme;

          if (theme == ThemeSetting.system) {
            if (brightness == Brightness.dark) {
              key = ThemeSetting.dark;
            } else {
              key = ThemeSetting.light;
            }
          }

          return builder(context, _themeData[key]);
        },
      );
    },
  );
}
