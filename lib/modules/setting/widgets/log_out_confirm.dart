import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'log_out_confirm.g.dart';

@swidget
Widget logOutConfirm(BuildContext context) {
  final sessionStore = Provider.of<SessionStore>(context);

  return AlertDialog(
    title: Text(AppLocalizations.of(context)!.logOutDialogTitle),
    content: Text(AppLocalizations.of(context)!.logOutDialogContent),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(AppLocalizations.of(context)!.cancelButtonLabel),
      ),
      TextButton(
        onPressed: () async {
          await sessionStore.deleteSession();
          analytics.logEvent(name: 'logout');
          Navigator.pop(context);
        },
        child: Text(AppLocalizations.of(context)!.logOutButtonLabel),
      ),
    ],
  );
}
