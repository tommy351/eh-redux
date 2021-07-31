import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'full_width.g.dart';

@swidget
Widget fullWidth(BuildContext context, {required Widget child}) {
  return SizedBox(
    width: double.infinity,
    child: child,
  );
}
