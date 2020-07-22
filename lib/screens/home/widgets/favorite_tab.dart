import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'scroll_view.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({Key key}) : super(key: key);

  static const _paginationKey = GalleryPaginationKey.favorite();

  @override
  Widget build(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context);
    final theme = Theme.of(context);

    return HomeScrollView(
      headerSliverBuilder: (context, _) => [
        SliverAppBar(
          title: Text(S.of(context).favorites),
          pinned: true,
        )
      ],
      body: SafeArea(
        top: false,
        bottom: false,
        child: Observer(
          builder: (context) {
            if (sessionStore.loginStatus != LoginStatus.loggedIn) {
              return Center(
                child: Text(S.of(context).logInRequired,
                    style: theme.textTheme.headline6),
              );
            }

            return const GalleryList(
              paginationKey: _paginationKey,
            );
          },
        ),
      ),
    );
  }
}
