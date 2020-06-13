import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/view/args.dart';
import 'package:eh_redux/screens/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryActions extends StatelessWidget {
  const GalleryActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gallery = Provider.of<Gallery>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ButtonBar(
        children: <Widget>[
          FlatButton.icon(
            icon: const Icon(Icons.favorite_border),
            label: const Text('Fav'),
            onPressed: () {
              //
            },
          ),
          RaisedButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('Read'),
            color: theme.accentColor,
            onPressed: () {
              Navigator.pushNamed(
                context,
                ViewScreen.routeName,
                arguments:
                    ViewScreenArguments((b) => b..id = gallery.id.toBuilder()),
              );
            },
          ),
        ],
      ),
    );
  }
}
