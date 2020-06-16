import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/view/args.dart';
import 'package:eh_redux/screens/view/screen.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fav_sheet.dart';

class GalleryActions extends StatelessWidget {
  const GalleryActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: ButtonBar(
            children: <Widget>[
              _buildFavButton(context),
              _buildReadButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadButton(BuildContext context) {
    final theme = Theme.of(context);
    final gallery = Provider.of<Gallery>(context);

    return RaisedButton.icon(
      icon: const Icon(Icons.play_arrow),
      label: const Text('Read'),
      color: theme.accentColor,
      onPressed: () {
        Navigator.pushNamed(
          context,
          ViewScreen.routeName,
          arguments: ViewScreenArguments((b) => b..id = gallery.id.toBuilder()),
        );
      },
    );
  }

  Widget _buildFavButton(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context);

    if (sessionStore.loginStatus != LoginStatus.loggedIn) {
      return Container();
    }

    final theme = Theme.of(context);
    final gallery = Provider.of<Gallery>(context);
    final details = Provider.of<GalleryDetails>(context);
    final currentFavorite = details?.currentFavorite ?? -1;
    final favorited = currentFavorite > -1;

    return FlatButton.icon(
      icon: Icon(
        favorited ? Icons.favorite : Icons.favorite_border,
        color: favorited
            ? favoriteColors[currentFavorite] ?? theme.primaryColor
            : null,
      ),
      label: favorited ? Text('Fav $currentFavorite') : const Text('Fav'),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return GalleryFavSheet(galleryId: gallery.id);
          },
        );
      },
    );
  }
}
