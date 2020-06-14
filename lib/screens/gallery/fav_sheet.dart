import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/gallery/fav_sheet_store.dart';
import 'package:eh_redux/stores/favorite.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class GalleryFavSheet extends StatefulWidget {
  final GalleryId galleryId;

  const GalleryFavSheet({
    Key key,
    @required this.galleryId,
  })  : assert(galleryId != null),
        super(key: key);

  @override
  _GalleryFavSheetState createState() => _GalleryFavSheetState();
}

class _GalleryFavSheetState extends State<GalleryFavSheet> {
  @override
  void initState() {
    super.initState();
    analytics.logEvent(name: 'open_fav_sheet');
  }

  @override
  void dispose() {
    analytics.logEvent(name: 'close_fav_sheet');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteStore = Provider.of<FavoriteStore>(context);

    return Provider(
      create: (_) => FavSheetStore(
        galleryId: widget.galleryId,
        favoriteStore: favoriteStore,
      ),
      child: _FavSheetContent(galleryId: widget.galleryId),
    );
  }
}

class _FavSheetContent extends StatelessWidget {
  final GalleryId galleryId;

  const _FavSheetContent({
    Key key,
    @required this.galleryId,
  })  : assert(galleryId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final store = Provider.of<FavSheetStore>(context);

    return DraggableScrollableSheet(
      minChildSize: 0.1,
      initialChildSize: 0.3,
      maxChildSize: 0.5,
      expand: false,
      builder: (context, controller) {
        return StatefulWrapper(
          onInit: (context) {
            store.initialize();
            return () {};
          },
          builder: (context) {
            return ListView(
              controller: controller,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Add to Favorites',
                    style: theme.textTheme.subtitle1
                        .copyWith(color: theme.textTheme.caption.color),
                  ),
                ),
                _buildDropdown(context),
                _buildButtonBar(context),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDropdown(BuildContext context) {
    final store = Provider.of<FavSheetStore>(context);

    return Observer(
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).padding +
              const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<int>(
            isExpanded: true,
            value: store.favorite,
            onChanged: (value) {
              store.setFavorite(value);
            },
            items: favoriteColors
                .asMap()
                .entries
                .map(
                  (e) => DropdownMenuItem<int>(
                    value: e.key,
                    child: Text('Favorites ${e.key}'),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    final theme = Theme.of(context);
    final store = Provider.of<FavSheetStore>(context);

    return Observer(
      builder: (context) {
        if (store.future?.status == FutureStatus.pending) {
          return const CenterProgressIndicator();
        }

        return Padding(
          padding: MediaQuery.of(context).padding,
          child: Row(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  store
                      .deleteFromFavorite()
                      .then((_) => Navigator.pop(context));
                },
                textColor: Colors.red,
                icon: Icon(Icons.delete),
                label: const Text('Delete'),
              ),
              const Spacer(),
              FlatButton.icon(
                onPressed: () {
                  store.addToFavorite().then((_) => Navigator.pop(context));
                },
                icon: Icon(Icons.add),
                textColor: theme.primaryColor,
                label: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
