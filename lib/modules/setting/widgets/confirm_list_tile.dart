import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'confirm_list_tile.g.dart';

@swidget
Widget confirmListTile(
  BuildContext context, {
  Widget title,
  Widget leading,
  Widget trailing,
  Widget dialogTitle,
  Widget dialogContent,
  bool disabled = false,
  @required Widget confirmActionChild,
  @required Function() onConfirm,
}) {
  return ListTile(
    title: title,
    leading: leading,
    trailing: trailing,
    onTap: disabled
        ? null
        : () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: dialogTitle,
                content: dialogContent,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context).cancelButtonLabel),
                  ),
                  TextButton(
                    onPressed: () async {
                      await onConfirm();
                      Navigator.pop(context);
                    },
                    child: confirmActionChild,
                  ),
                ],
              ),
            );
          },
  );
}
