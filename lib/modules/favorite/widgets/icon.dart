import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'icon.g.dart';

@swidget
Widget favoriteIcon(
  BuildContext context, {
  @required int favorite,
}) {
  final data = IconTheme.of(context);
  const colors = [
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.blueAccent,
    Colors.purple,
    Colors.pink,
  ];

  return Container(
    width: data.size,
    height: data.size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: colors[favorite] ?? Colors.grey,
    ),
  );
}
