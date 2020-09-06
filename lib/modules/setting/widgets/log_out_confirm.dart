import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'log_out_confirm.g.dart';

@swidget
Widget logOutConfirm(BuildContext context) {
  final sessionStore = Provider.of<SessionStore>(context);

  return AlertDialog(
    title: Text(S.of(context).logOutDialogTitle),
    content: Text(S.of(context).logOutDialogContent),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(S.of(context).cancelButtonLabel),
      ),
      FlatButton(
        onPressed: () async {
          await sessionStore.deleteSession();
          analytics.logEvent(name: 'logout');
          Navigator.pop(context);
        },
        child: Text(S.of(context).logOutButtonLabel),
      ),
    ],
  );
}
