import 'package:eh_redux/screens/login/screen.dart';
import 'package:eh_redux/screens/setting/screen.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        if (sessionStore.loginStatus == LoginStatus.loggedIn) {
          return ListTile(
            title: const Text('Log out'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Log out?'),
                    content: const Text(
                        'This will delete the session stored on this device.'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      FlatButton(
                        onPressed: () {
                          sessionStore.deleteSession();
                          Navigator.pop(context);
                        },
                        child: const Text('Log out'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }

        return ListTile(
          title: const Text('Log in'),
          leading: const Icon(Icons.person),
          enabled: sessionStore.loginStatus != LoginStatus.pending,
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
        );
      },
    );
  }
}
