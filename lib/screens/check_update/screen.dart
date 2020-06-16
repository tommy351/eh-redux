import 'package:eh_redux/screens/check_update/store.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Updates'),
      ),
      body: _buildBody(),
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
            return _buildCenterText('Failed to check updates.');
          }

          if (_store.status == UpdateStatus.noUpdate) {
            return _buildCenterText('You are up to date');
          }

          final release = _store.releaseFuture.value;
          final asset = release.assets.first;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          release.name,
                          style: theme.textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      tryLaunch(release.htmlUrl);
                    },
                    child: const Text('Open in browser'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      tryLaunch(asset.browserDownloadUrl);
                    },
                    child: const Text('Download'),
                  ),
                ],
              ),
              Html(data: release.body),
            ],
          );
        },
      ),
    );
  }
}
