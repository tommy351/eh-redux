import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar(
    this.rating, {
    Key key,
    this.size,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : assert(rating != null),
        super(key: key);

  final double rating;
  final double size;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
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
