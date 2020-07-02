import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/check_update/store.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

enum _CheckUpdateAction {
  openInBrowser,
}

class CheckUpdateScreen extends StatefulWidget {
  const CheckUpdateScreen({Key key}) : super(key: key);

  static const routeName = '/checkUpdate';

  @override
  _CheckUpdateScreenState createState() => _CheckUpdateScreenState();
}

class _CheckUpdateScreenState extends State<CheckUpdateScreen> {
  CheckUpdateStore _store;

  @override
  void initState() {
    super.initState();
    _store = CheckUpdateStore()..check();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final actions = <Widget>[];

        if (_store.releaseFuture.value != null) {
          actions.add(PopupMenuButton<_CheckUpdateAction>(
            onSelected: (action) {
              switch (action) {
                case _CheckUpdateAction.openInBrowser:
                  tryLaunch(_store.releaseFuture.value.htmlUrl);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _CheckUpdateAction.openInBrowser,
                child: Text(S.of(context).openInBrowser),
              ),
            ],
          ));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).checkUpdates),
            actions: actions,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildBody(),
          ),
        );
      },
    );
  }

  Widget _buildCenterText(String text) {
    final theme = Theme.of(context);

    return Center(
      child: Text(text, style: theme.textTheme.headline6),
    );
  }

  Widget _buildBody() {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Observer(
        builder: (context) {
          if (_store.status == UpdateStatus.pending) {
            return const CenterProgressIndicator();
          }

          if (_store.status == UpdateStatus.failed) {
            return _buildCenterText(S.of(context).checkUpdateError);
          }

          final release = _store.releaseFuture.value;

          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      release.name,
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  _buildDownloadButton(release),
                ],
              ),
              Expanded(
                child: Markdown(
                  data: release.body,
                  padding: const EdgeInsets.only(top: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDownloadButton(GitHubRelease release) {
    return Observer(
      builder: (context) {
        final asset = _store.asset;

        if (asset == null || _store.status != UpdateStatus.canUpdate) {
          return FlatButton(
            onPressed: null,
            child: Text(S.of(context).upToDate),
          );
        }

        return RaisedButton.icon(
          onPressed: () {
            tryLaunch(asset.browserDownloadUrl);
          },
          color: Theme.of(context).accentColor,
          icon: Icon(Icons.file_download),
          label: Text(S.of(context).downloadButtonLabel(filesize(asset.size))),
        );
      },
    );
  }
}
