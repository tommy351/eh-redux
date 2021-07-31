import 'package:eh_redux/modules/check_update/store.dart';
import 'package:eh_redux/modules/check_update/types.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'screen.g.dart';

enum _PopupAction {
  openInBrowser,
}

class CheckUpdateScreen extends StatefulWidget {
  const CheckUpdateScreen({Key? key}) : super(key: key);

  static String route = '/checkUpdate';

  @override
  _CheckUpdateScreenState createState() => _CheckUpdateScreenState();
}

class _CheckUpdateScreenState extends State<CheckUpdateScreen> {
  late CheckUpdateStore _store;

  @override
  void initState() {
    super.initState();
    _store = CheckUpdateStore()..check();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _store,
      child: Observer(
        builder: (context) {
          final actions = <Widget>[];
          final value = _store.releaseFuture?.value;

          if (value != null) {
            actions.add(PopupMenuButton<_PopupAction>(
              onSelected: (action) {
                switch (action) {
                  case _PopupAction.openInBrowser:
                    tryLaunch(value.htmlUrl);
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: _PopupAction.openInBrowser,
                  child: Text(AppLocalizations.of(context)!
                      .checkUpdateActionOpenInBrowser),
                ),
              ],
            ));
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.checkUpdateScreenTitle),
              actions: actions,
            ),
            body: const _Body(),
          );
        },
      ),
    );
  }
}

@swidget
Widget _body(BuildContext context) {
  final theme = Theme.of(context);
  final store = Provider.of<CheckUpdateStore>(context);

  return Padding(
    padding: const EdgeInsets.all(16),
    child: SafeArea(
      top: false,
      child: Observer(
        builder: (context) {
          final release = store.releaseFuture?.value;

          if (store.status == UpdateStatus.pending || release == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (store.status == UpdateStatus.failed) {
            return Center(
              child:
                  Text(AppLocalizations.of(context)!.checkUpdateErrorMessage),
            );
          }

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      release.name,
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  const _DownloadButton(),
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
    ),
  );
}

@swidget
Widget _downloadButton(BuildContext context) {
  final store = Provider.of<CheckUpdateStore>(context);

  return Observer(
    builder: (context) {
      final asset = store.asset;

      if (store.status != UpdateStatus.canUpdate || asset == null) {
        return TextButton(
          onPressed: null,
          child: Text(AppLocalizations.of(context)!.checkUpdateUpToDate),
        );
      }

      return ElevatedButton.icon(
        onPressed: () {
          tryLaunch(asset.browserDownloadUrl);
        },
        icon: const Icon(Icons.file_download),
        label: Text(
          AppLocalizations.of(context)!
              .checkUpdateDownloadButtonLabel(filesize(asset.size)),
        ),
      );
    },
  );
}
