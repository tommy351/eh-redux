import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/stores/setting.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:eh_redux/widgets/select_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    final settingStore = Provider.of<SettingStore>(context);
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: Observer(
        builder: (context) {
          return ListView(
            children: <Widget>[
              _buildTitle(context, S.of(context).appearance),
              SelectListTile<ThemeSetting>(
                title: Text(S.of(context).theme),
                items: [
                  DropdownMenuItem(
                    value: ThemeSetting.system,
                    child: Text(S.of(context).themeSystem),
                  ),
                  DropdownMenuItem(
                    value: ThemeSetting.light,
                    child: Text(S.of(context).themeLight),
                  ),
                  DropdownMenuItem(
                    value: ThemeSetting.dark,
                    child: Text(S.of(context).themeDark),
                  ),
                  DropdownMenuItem(
                    value: ThemeSetting.black,
                    child: Text(S.of(context).themeBlack),
                  ),
                ],
                onChanged: settingStore.setTheme,
                value: settingStore.theme.value,
              ),
              const Divider(),
              _buildTitle(context, S.of(context).galleryList),
              CheckboxListTile(
                title: Text(S.of(context).displayJapaneseTitle),
                value: settingStore.displayJapaneseTitle.value,
                onChanged: settingStore.setDisplayJapaneseTitle,
              ),
              const Divider(),
              _buildTitle(context, S.of(context).imageView),
              SelectListTile<OrientationSetting>(
                title: Text(S.of(context).screenOrientation),
                items: [
                  DropdownMenuItem(
                    value: OrientationSetting.auto,
                    child: Text(S.of(context).orientationAuto),
                  ),
                  DropdownMenuItem(
                    value: OrientationSetting.portrait,
                    child: Text(S.of(context).orientationPortrait),
                  ),
                  DropdownMenuItem(
                    value: OrientationSetting.landscape,
                    child: Text(S.of(context).orientationLandscape),
                  ),
                ],
                onChanged: settingStore.setOrientation,
                value: settingStore.orientation.value,
              ),
              CheckboxListTile(
                title: Text(S.of(context).turnPagesWithVolumeKeys),
                value: settingStore.turnPagesWithVolumeKeys.value,
                onChanged: settingStore.setTurnPagesWithVolumeKeys,
              ),
              const Divider(),
              _buildTitle(context, S.of(context).search),
              ListTile(
                title: Text(S.of(context).clearSearchHistory),
                onTap: () {
                  database.searchHistoriesDao.deleteAllEntries().then((_) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(S.of(context).searchHistoryClearSuccess),
                    ));
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        title,
        style: theme.textTheme.bodyText1
            .copyWith(color: theme.textTheme.caption.color),
      ),
    );
  }
}
