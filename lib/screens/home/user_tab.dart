import 'package:eh_redux/screens/login/screen.dart';
import 'package:eh_redux/screens/setting/screen.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildLoginTile(context),
        ListTile(
          title: const Text('Settings'),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pushNamed(context, SettingScreen.routeName);
          },
        ),
      ],
    );
  }

  Widget _buildLoginTile(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context);

    return Observer(
      builder: (context) {
        final session = sessionStore.session;

        if (session.status == FutureStatus.fulfilled &&
            session.value != null &&
            session.value.isNotEmpty) {
          return ListTile(
            title: const Text('Log out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {},
          );
        }

        return ListTile(
          title: const Text('Log in'),
          leading: const Icon(Icons.person),
          enabled: session.status != FutureStatus.pending,
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
        );
      },
    );
  }
}
