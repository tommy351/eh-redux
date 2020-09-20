import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/gallery/stores/network_list.dart';
import 'package:eh_redux/modules/gallery/widgets/network_list.dart';
import 'package:eh_redux/modules/home/widgets/body.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'tab.g.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({Key key}) : super(key: key);

  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab>
    with AutomaticKeepAliveClientMixin<FavoriteTab> {
  NetworkGalleryListStore _store;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _store = NetworkGalleryListStore(
      client: Provider.of<EHentaiClient>(context, listen: false),
      path: '/favorites.php',
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final sessionStore = Provider.of<SessionStore>(context);

    return Provider.value(
      value: _store,
      child: Observer(
        builder: (context) {
          if (sessionStore.loginStatus != LoginStatus.loggedIn) {
            return const _LoginHint();
          }

          return const _Content();
        },
      ),
    );
  }
}

@swidget
Widget _appBar(BuildContext context) {
  return SliverAppBar(
    title: Text(S.of(context).homeTabTitleFavorite),
    pinned: true,
  );
}

@swidget
Widget _loginHint(BuildContext context) {
  final theme = Theme.of(context);

  return CustomScrollView(
    slivers: [
      const _AppBar(),
      SliverFillRemaining(
        child: Center(
          child: Text(
            S.of(context).logInRequiredHint,
            style: theme.textTheme.headline6,
          ),
        ),
      ),
    ],
  );
}

@swidget
Widget _content(BuildContext context) {
  return NestedScrollView(
    headerSliverBuilder: (context, _) => const [
      _AppBar(),
    ],
    body: const HomeBody(
      child: NetworkGalleryList(),
    ),
  );
}
