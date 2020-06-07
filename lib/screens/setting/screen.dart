import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(),
    );
  }
}
