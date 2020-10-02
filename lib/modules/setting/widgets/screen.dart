import 'package:eh_redux/database/database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/common/widgets/loading_dialog.dart';
import 'package:eh_redux/modules/setting/store.dart';
import 'package:eh_redux/modules/setting/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'confirm_list_tile.dart';
import 'select_list_tile.dart';

part 'screen.g.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  static const route = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settingScreenTitle),
      ),
      body: const SafeArea(
        child: _Body(),
      ),
    );
  }
}

@swidget
Widget _body(BuildContext context) {
  final settingStore = Provider.of<SettingStore>(context);
  final database = Provider.of<Database>(context);

  return ListView(
    children: [
      _Title(AppLocalizations.of(context).settingSectionAppearance),
      _SelectTile(
        title: AppLocalizations.of(context).settingTheme,
        preference: settingStore.theme,
        items: [
          DropdownMenuItem(
            value: ThemeSetting.system,
            child: Text(AppLocalizations.of(context).settingThemeSystem),
          ),
          DropdownMenuItem(
            value: ThemeSetting.light,
            child: Text(AppLocalizations.of(context).settingThemeLight),
          ),
          DropdownMenuItem(
            value: ThemeSetting.dark,
            child: Text(AppLocalizations.of(context).settingThemeDark),
          ),
          DropdownMenuItem(
            value: ThemeSetting.black,
            child: Text(AppLocalizations.of(context).settingThemeBlack),
          ),
        ],
      ),
      const Divider(),
      _Title(AppLocalizations.of(context).settingSectionGallery),
      _SwitchTile(
        title: AppLocalizations.of(context).settingDisplayJapaneseTitle,
        preference: settingStore.displayJapaneseTitle,
      ),
      _SwitchTile(
        title: AppLocalizations.of(context).settingDisplayContentWarning,
        preference: settingStore.displayContentWarning,
      ),
      ConfirmListTile(
        title: Text(AppLocalizations.of(context).settingClearReadingHistory),
        dialogTitle:
            Text(AppLocalizations.of(context).clearReadingHistoryDialogTitle),
        dialogContent:
            Text(AppLocalizations.of(context).clearReadingHistoryDialogContent),
        confirmActionChild: Text(AppLocalizations.of(context).clearButtonLabel),
        onConfirm: () async {
          await showLoadingDialog(
            context: context,
            future: database.historyDao.deleteAll(),
          );

          Scaffold.of(context).showSnackBar(SnackBar(
            content:
                Text(AppLocalizations.of(context).readingHistoryClearSuccess),
          ));
        },
      ),
      const Divider(),
      _Title(AppLocalizations.of(context).settingSectionImage),
      _SelectTile<OrientationSetting>(
        title: AppLocalizations.of(context).settingScreenOrientation,
        preference: settingStore.orientation,
        items: [
          DropdownMenuItem(
            value: OrientationSetting.auto,
            child:
                Text(AppLocalizations.of(context).settingScreenOrientationAuto),
          ),
          DropdownMenuItem(
            value: OrientationSetting.portrait,
            child: Text(
                AppLocalizations.of(context).settingScreenOrientationPortrait),
          ),
          DropdownMenuItem(
            value: OrientationSetting.landscape,
            child: Text(
                AppLocalizations.of(context).settingScreenOrientationLandscape),
          ),
        ],
      ),
      _SwitchTile(
        title: AppLocalizations.of(context).settingTurnPagesWithVolumeKeys,
        preference: settingStore.turnPagesWithVolumeKeys,
      ),
      ConfirmListTile(
        title: Text(AppLocalizations.of(context).settingClearImageCache),
        dialogTitle:
            Text(AppLocalizations.of(context).clearImageCacheDialogTitle),
        dialogContent:
            Text(AppLocalizations.of(context).clearImageCacheDialogContent),
        confirmActionChild: Text(AppLocalizations.of(context).clearButtonLabel),
        onConfirm: () async {
          final manager = DefaultCacheManager();
          await showLoadingDialog(
            context: context,
            future: manager.emptyCache(),
          );

          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context).imageCacheClearSuccess),
          ));
        },
      ),
      const Divider(),
      _Title(AppLocalizations.of(context).settingSectionSearch),
      ConfirmListTile(
        title: Text(AppLocalizations.of(context).settingClearSearchHistory),
        dialogTitle:
            Text(AppLocalizations.of(context).clearSearchHistoryDialogTitle),
        dialogContent:
            Text(AppLocalizations.of(context).clearSearchHistoryDialogContent),
        confirmActionChild: Text(AppLocalizations.of(context).clearButtonLabel),
        onConfirm: () async {
          await showLoadingDialog(
            context: context,
            future: database.searchHistoriesDao.deleteAllEntries(),
          );

          Scaffold.of(context).showSnackBar(SnackBar(
            content:
                Text(AppLocalizations.of(context).searchHistoryClearSuccess),
          ));
        },
      ),
    ],
  );
}

@swidget
Widget _title(BuildContext context, String title) {
  final theme = Theme.of(context);

  return ListTile(
    title: Text(
      title,
      style: theme.textTheme.bodyText1
          .copyWith(color: theme.textTheme.caption.color),
    ),
  );
}

@swidget
Widget _selectTile<T>(
  BuildContext context, {
  @required String title,
  @required Preference<T> preference,
  @required List<DropdownMenuItem<T>> items,
}) {
  return PreferenceBuilder<T>(
    preference: preference,
    builder: (context, value) => SelectListTile<T>(
      title: Text(title),
      items: items,
      onChanged: preference.setValue,
      value: value,
    ),
  );
}

@swidget
Widget _switchTile(
  BuildContext context, {
  @required String title,
  @required Preference<bool> preference,
}) {
  return PreferenceBuilder<bool>(
    preference: preference,
    builder: (context, value) => SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: preference.setValue,
    ),
  );
}
