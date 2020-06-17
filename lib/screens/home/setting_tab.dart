import 'package:eh_redux/generated/l10n.dart';
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
        SliverAppBar(
          title: Text(S.of(context).settings),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            _buildLoginTile(context),
            ListTile(
              title: Text(S.of(context).settings),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, SettingScreen.routeName);
              },
            ),
            const Divider(),
            ListTile(
              title: Text(S.of(context).projectPage),
              leading: const Icon(Icons.home),
              onTap: () {
                tryLaunch(_projectUrl);
              },
            ),
            ListTile(
              title: Text(S.of(context).licenses),
              leading: const Icon(Icons.account_balance),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
            ListTile(
              title: Text(S.of(context).checkUpdates),
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
            title: Text(S.of(context).logOut),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(S.of(context).logOutDialogTitle),
                    content: Text(S.of(context).logOutDialogContent),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(MaterialLocalizations.of(context)
                            .cancelButtonLabel),
                      ),
                      FlatButton(
                        onPressed: () {
                          sessionStore.deleteSession();
                          analytics.logEvent(name: 'logout');
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).logOut),
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
