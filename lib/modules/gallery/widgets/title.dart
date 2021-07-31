import 'package:eh_redux/modules/setting/store.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

part 'title.g.dart';

@swidget
Widget galleryTitle(
  BuildContext context, {
  required String title,
  String titleJpn = '',
}) {
  final settingStore = Provider.of<SettingStore>(context);

  return PreferenceBuilder<bool>(
    preference: settingStore.displayJapaneseTitle,
    builder: (context, displayJapaneseTitle) {
      return Text(
          displayJapaneseTitle && titleJpn.isNotEmpty ? titleJpn : title);
    },
  );
}
