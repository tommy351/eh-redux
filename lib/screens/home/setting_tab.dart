import 'package:eh_redux/screens/check_update/screen.dart';
import 'package:eh_redux/screens/login/screen.dart';
import 'package:eh_redux/screens/setting/screen.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({Key key}) : super(key: key);

  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  static const _projectUrl = 'https://github.com/tommy351/eh-redux';

  Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          title: Text('Settings'),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            _buildLoginTile(context),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, SettingScreen.routeName);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Project Page'),
              leading: const Icon(Icons.home),
              onTap: () {
                tryLaunch(_projectUrl);
              },
            ),
            ListTile(
              title: const Text('Licenses'),
              leading: const Icon(Icons.account_balance),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
            ListTile(
              title: const Text('Check Updates'),
              leading: const Icon(Icons.system_update),
              onTap: () {
                Navigator.pushNamed(context, CheckUpdateScreen.routeName);
              },
            ),
            _buildVersionTile(),
          ]),
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
                          analytics.logEvent(name: 'logout');
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

  Widget _buildVersionTile() {
    final theme = Theme.of(context);

    return FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return ListTile(
          dense: true,
          title: Text(
            'Version ${snapshot.data.version}',
            style: theme.textTheme.caption,
          ),
        );
      },
    );
  }
}
