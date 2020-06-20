import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/favorite_colors.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/view/args.dart';
import 'package:eh_redux/screens/view/screen.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fav_sheet.dart';

class GalleryActions extends StatelessWidget {
  const GalleryActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error = Provider.of<GalleryError>(context);

    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: error != null
              ? _buildError(context, error)
              : _buildButtonBar(context),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, GalleryError error) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.errorColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: error.map(
          (value) => _buildErrorContent(
            context: context,
            title: S.of(context).galleryGenericErrorTitle,
            child: value.message,
          ),
          contentWarning: (value) => _buildErrorContent(
            context: context,
            title: S.of(context).galleryContentWarningTitle,
            child: S.of(context).galleryContentWarningMessage(value.reason),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContent({
    @required BuildContext context,
    @required String title,
    @required String child,
  }) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.warning, size: 24, color: theme.errorColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: theme.textTheme.bodyText1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(child),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        _buildFavButton(context),
        _buildReadButton(context),
      ],
    );
  }

  Widget _buildReadButton(BuildContext context) {
    final theme = Theme.of(context);
    final gallery = Provider.of<Gallery>(context);

    return RaisedButton.icon(
      icon: const Icon(Icons.play_arrow),
      label: Text(S.of(context).readButtonLabel),
      color: theme.accentColor,
      onPressed: () {
        Navigator.pushNamed(
          context,
          ViewScreen.routeName,
          arguments: ViewScreenArguments(id: gallery.id),
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
      label: favorited
          ? Text('Fav $currentFavorite')
          : Text(S.of(context).favoriteButtonLabel),
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
