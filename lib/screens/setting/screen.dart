import 'package:eh_redux/stores/setting.dart';
import 'package:eh_redux/widgets/select_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingStore = Provider.of<SettingStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Observer(
        builder: (context) {
          return ListView(
            children: <Widget>[
              _buildTitle(context, 'Gallery List'),
              CheckboxListTile(
                title: const Text('Display Japanese title if available'),
                value: settingStore.displayJapaneseTitle.value,
                onChanged: settingStore.setDisplayJapaneseTitle,
              ),
              const Divider(),
              _buildTitle(context, 'Image View'),
              SelectListTile<OrientationSetting>(
                title: const Text('Screen orientation'),
                items: const [
                  DropdownMenuItem(
                    value: OrientationSetting.auto,
                    child: Text('Auto'),
                  ),
                  DropdownMenuItem(
                    value: OrientationSetting.portrait,
                    child: Text('Portrait'),
                  ),
                  DropdownMenuItem(
                    value: OrientationSetting.landscape,
                    child: Text('Landscape'),
                  ),
                ],
                onChanged: settingStore.setOrientation,
                value: settingStore.orientation.value,
              ),
              CheckboxListTile(
                title: const Text('Turn pages using volume buttons'),
                value: settingStore.turnPagesWithVolumeKeys.value,
                onChanged: settingStore.setTurnPagesWithVolumeKeys,
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
