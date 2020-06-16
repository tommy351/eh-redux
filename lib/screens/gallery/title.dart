import 'package:flutter/material.dart';

class GallerySectionTitle extends StatelessWidget {
  const GallerySectionTitle({
    Key key,
    @required this.title,
  })  : assert(title != null),
        super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: DefaultTextStyle(
        style:
            theme.textTheme.headline6.copyWith(fontWeight: FontWeight.normal),
        child: title,
      ),
    );
  }
}
