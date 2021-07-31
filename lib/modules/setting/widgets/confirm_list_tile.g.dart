// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_list_tile.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ConfirmListTile extends StatelessWidget {
  const ConfirmListTile(
      {Key? key,
      this.title,
      this.leading,
      this.trailing,
      this.dialogTitle,
      this.dialogContent,
      this.disabled = false,
      required this.confirmActionChild,
      required this.onConfirm})
      : super(key: key);

  final Widget? title;

  final Widget? leading;

  final Widget? trailing;

  final Widget? dialogTitle;

  final Widget? dialogContent;

  final bool disabled;

  final Widget confirmActionChild;

  final dynamic Function() onConfirm;

  @override
  Widget build(BuildContext _context) => confirmListTile(_context,
      title: title,
      leading: leading,
      trailing: trailing,
      dialogTitle: dialogTitle,
      dialogContent: dialogContent,
      disabled: disabled,
      confirmActionChild: confirmActionChild,
      onConfirm: onConfirm);
}
