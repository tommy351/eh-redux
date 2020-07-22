import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/download.dart';
import 'package:eh_redux/models/favorite_colors.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/view/args.dart';
import 'package:eh_redux/screens/view/screen.dart';
import 'package:eh_redux/stores/download.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    final galleryStore = Provider.of<GalleryStore>(context);
    final gallery = Provider.of<Gallery>(context);

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
            actions: [
              RaisedButton.icon(
                icon: Icon(Icons.refresh),
                label: Text(S.of(context).retry),
                onPressed: () {
                  galleryStore.loadGalleryDetails(gallery.id);
                },
              ),
            ],
          ),
          contentWarning: (value) => _buildErrorContent(
            context: context,
            title: S.of(context).galleryContentWarningTitle,
            child: S.of(context).galleryContentWarningMessage(value.reason),
            actions: [
              RaisedButton.icon(
                icon: Icon(Icons.close),
                label: Text(S.of(context).galleryHideContentWarning),
                onPressed: () {
                  galleryStore.disableContentWarning(gallery.id);
                  galleryStore.loadGalleryDetails(gallery.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContent({
    @required BuildContext context,
    @required String title,
    @required String child,
    List<Widget> actions,
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
              _buildErrorActions(context, actions),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorActions(BuildContext context, List<Widget> children) {
    if (children == null || children.isEmpty) return Container();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        _buildFavButton(context),
        _buildDownloadButton(context),
        _buildReadButton(context),
      ],
    );
  }

  Widget _buildReadButton(BuildContext context) {
    final theme = Theme.of(context);
    final gallery = Provider.of<Gallery>(context);
    final galleryStore = Provider.of<GalleryStore>(context);

    return RaisedButton.icon(
      icon: const Icon(Icons.play_arrow),
      label: Text(S.of(context).readButtonLabel),
      color: theme.accentColor,
      onPressed: () {
        galleryStore.saveGallery(gallery.id);
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

  Widget _buildDownloadButton(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final galleryStore = Provider.of<GalleryStore>(context);
    final downloadStore = Provider.of<DownloadStore>(context);
    final galleryId = gallery.id.id;

    return StatefulWrapper(
      onInit: (context) {
        final sub = downloadStore.watchOne(galleryId);
        return () => sub.cancel();
      },
      builder: (context) {
        return Observer(
          builder: (context) {
            final task = downloadStore.data[galleryId];

            switch (task?.state) {
              case DownloadTaskState.started:
                // TODO: Show "Pause"
                break;
              case DownloadTaskState.paused:
                // TODO: Show "Resume"
                break;
              case DownloadTaskState.failed:
                // TODO: Show "Retry" if possible
                break;
              case DownloadTaskState.succeeded:
                // TODO: Show context menu?
                break;
            }

            return IconButton(
              onPressed: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GalleryDownloadSheet();
                  },
                );
                await galleryStore.saveGallery(gallery.id);
                await downloadStore.start(DownloadTask.fromGallery(gallery));
              },
              icon: const Icon(Icons.file_download),
              tooltip: S.of(context).downloads,
            );
          },
        );
      },
    );
  }
}
