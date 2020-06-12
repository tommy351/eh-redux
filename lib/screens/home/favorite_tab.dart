import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context);
    final theme = Theme.of(context);

    return Observer(
      builder: (context) {
        if (sessionStore.loginStatus != LoginStatus.loggedIn) {
          return Center(
            child:
                Text('Please log in first', style: theme.textTheme.headline6),
          );
        }

        return const GalleryList(
          paginationKey: GalleryPaginationKeyFavorite(),
        );
      },
    );
  }
}
