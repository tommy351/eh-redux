import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'bottom_sheet_container.g.dart';

@swidget
Widget bottomSheetContainer(
  BuildContext context, {
  @required Widget child,
}) {
  final mediaQuery = MediaQuery.of(context);

  return Padding(
    padding: mediaQuery.padding + mediaQuery.viewInsets,
    child: child,
  );
}
