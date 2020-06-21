import 'package:flutter/material.dart';

class ConfirmTile extends StatelessWidget {
  const ConfirmTile({
    Key key,
    @required this.title,
    @required this.onConfirm,
    @required this.dialogTitle,
    @required this.dialogContent,
    @required this.confirmActionChild,
  }) : super(key: key);

  final Widget title;
  final Function() onConfirm;
  final Widget dialogTitle;
  final Widget dialogContent;
  final Widget confirmActionChild;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: dialogTitle,
              content: dialogContent,
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text(MaterialLocalizations.of(context).cancelButtonLabel),
                ),
                FlatButton(
                  onPressed: () {
                    onConfirm();
                    Navigator.pop(context);
                  },
                  child: confirmActionChild,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
