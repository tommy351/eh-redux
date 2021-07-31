import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'body.g.dart';

@swidget
Widget homeBody(BuildContext context, {required Widget child}) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: child,
  );
}
