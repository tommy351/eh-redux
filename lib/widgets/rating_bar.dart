import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const RatingBar(
    this.rating, {
    Key key,
    this.size,
    this.color,
  })  : assert(rating != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Iterable<int>.generate(5)
          .map((e) => Icon(
                _getIconData(rating - e),
                color: color,
                size: size,
              ))
          .toList(),
    );
  }

  IconData _getIconData(double n) {
    if (n >= 0.75) return Icons.star;
    if (n >= 0.3) return Icons.star_half;
    return Icons.star_border;
  }
}
