import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'rating_bar.g.dart';

@swidget
Widget ratingBar(BuildContext context, double rating) {
  return Row(
    children: Iterable<int>.generate(5)
        .map((e) => Icon(_getIconData(rating - e)))
        .toList(),
  );
}

IconData _getIconData(double n) {
  if (n >= 0.75) return Icons.star;
  if (n >= 0.25) return Icons.star_half;
  return Icons.star_border;
}
