import 'package:ehreader/stores/setting.dart';
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
              CheckboxListTile(
                title: const Text('Display Japanese title if available'),
                value: settingStore.displayJapaneseTitle.value ?? false,
                onChanged: (bool value) {
                  settingStore.setDisplayJapaneseTitle(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
