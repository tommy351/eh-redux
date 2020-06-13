import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/favorite.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int _selectedFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final favoriteStore = Provider.of<FavoriteStore>(context);

    return DraggableScrollableSheet(
      minChildSize: 0.1,
      initialChildSize: 0.3,
      maxChildSize: 0.5,
      expand: false,
      builder: (context, controller) {
        return StatefulWrapper(
          onInit: (context) {
            favoriteStore.loadFavoriteStatus(widget.galleryId);
            _updateSelectedFavorite(favoriteStore.status[widget.galleryId]);

            return reaction<FavoriteStatus>(
                (_) => favoriteStore.status[widget.galleryId],
                _updateSelectedFavorite);
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
                _buildDropdown(),
                _buildButtonBar(),
              ],
            );
          },
        );
      },
    );
  }

  void _updateSelectedFavorite(FavoriteStatus status) {
    if (status != null && _selectedFavorite == null) {
      setState(() {
        _selectedFavorite = status.favorite;
      });
    }
  }

  Widget _buildDropdown() {
    return Padding(
      padding: MediaQuery.of(context).padding +
          const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<int>(
        isExpanded: true,
        value: _selectedFavorite,
        onChanged: (value) {
          setState(() {
            _selectedFavorite = value;
          });
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
  }

  Widget _buildButtonBar() {
    final theme = Theme.of(context);

    return Padding(
      padding: MediaQuery.of(context).padding,
      child: Row(
        children: <Widget>[
          FlatButton.icon(
            onPressed: () {
              //
            },
            textColor: Colors.red,
            icon: Icon(Icons.delete),
            label: const Text('Delete from Favorites'),
          ),
          const Spacer(),
          FlatButton.icon(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add),
            textColor: theme.primaryColor,
            label: const Text('Add to Favorites'),
          ),
        ],
      ),
    );
  }
}
