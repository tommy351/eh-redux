import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/check_update/widgets/screen.dart';
import 'package:eh_redux/modules/login/widgets/screen.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/modules/setting/widgets/log_out_confirm.dart';
import 'package:eh_redux/modules/setting/widgets/screen.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

part 'tab.g.dart';

@swidget
Widget settingTab(BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        title: Text(S.of(context).homeTabTitleSettings),
        pinned: true,
      ),
      SliverSafeArea(
        top: false,
        sliver: SliverList(
          delegate: SliverChildListDelegate.fixed([
            const _LoginTile(),
            ListTile(
              title: Text(S.of(context).settingTabSettings),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, SettingScreen.route);
              },
            ),
            const Divider(),
            ListTile(
              title: Text(S.of(context).settingTabProjectPage),
              leading: const Icon(Icons.home),
              onTap: () {
                tryLaunch('https://github.com/tommy351/eh-redux');
              },
            ),
            ListTile(
              title: Text(S.of(context).settingTabLicenses),
              leading: const Icon(Icons.account_balance),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
            ListTile(
              title: Text(S.of(context).settingTabCheckUpdates),
              leading: const Icon(Icons.system_update),
              onTap: () {
                Navigator.pushNamed(context, CheckUpdateScreen.route);
              },
            ),
            const _VersionTile(),
          ]),
        ),
      ),
    ],
  );
}

@swidget
Widget _loginTile(BuildContext context) {
  final sessionStore = Provider.of<SessionStore>(context);

  return Observer(
    builder: (context) {
      if (sessionStore.loginStatus == LoginStatus.loggedIn) {
        return ListTile(
          title: Text(S.of(context).settingTabLogOut),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const LogOutConfirm();
              },
            );
          },
        );
      }

      return ListTile(
        title: Text(S.of(context).settingTabLogIn),
        leading: const Icon(Icons.person),
        enabled: sessionStore.loginStatus != LoginStatus.pending,
        onTap: () {
          Navigator.pushNamed(context, LoginScreen.route);
        },
      );
    },
  );
}

@swidget
Widget _versionTile(BuildContext context) {
  final theme = Theme.of(context);

  return FutureBuilder<PackageInfo>(
    future: PackageInfo.fromPlatform(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Container();
      }

      return ListTile(
        dense: true,
        title: Text(
          S.of(context).settingTabVersion(snapshot.data.version),
          style: theme.textTheme.caption,
        ),
      );
    },
  );
}
