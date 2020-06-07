import 'package:ehreader/screens/login/screen.dart';
import 'package:ehreader/screens/setting/screen.dart';
import 'package:ehreader/stores/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context);

    return ListView(
      children: <Widget>[
        Observer(
          builder: (context) {
            if (sessionStore.session.status == FutureStatus.fulfilled &&
                sessionStore.session.value.isNotEmpty) {
              return ListTile(
                title: const Text('Log out'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  sessionStore.deleteSession();
                },
              );
            }

            return ListTile(
              title: const Text('Log in'),
              leading: const Icon(Icons.person),
              enabled: sessionStore.session.status != FutureStatus.pending,
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            );
          },
        ),
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
}
