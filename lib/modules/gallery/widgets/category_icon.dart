import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'category_icon.g.dart';

@swidget
Widget categoryIcon(
  BuildContext context, {
  @required String category,
}) {
  final data = IconTheme.of(context);
  const colors = <String, Color>{
    'Doujinshi': Colors.red,
    'Manga': Colors.orange,
    'Artist CG': Colors.yellow,
    'Game CG': Colors.green,
    'Western': Colors.lightGreen,
    'Non-H': Colors.lightBlue,
    'Image Set': Colors.indigo,
    'Cosplay': Colors.purple,
    'Asian Porn': Colors.deepPurple,
  };

  return Container(
    width: data.size,
    height: data.size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: colors[category] ?? Colors.grey,
    ),
  );
}
