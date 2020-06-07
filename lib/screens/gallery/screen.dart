import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:ehreader/screens/gallery/args.dart';
import 'package:ehreader/screens/view/args.dart';
import 'package:ehreader/screens/view/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:ehreader/widgets/gallery_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class GalleryScreen extends StatelessWidget {
  static String routeName = '/gallery';

  const GalleryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as GalleryScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);
    final client = Provider.of<EHentaiClient>(context);

    return Observer(
      builder: (context) {
        final gallery = galleryStore.data[args.id];

        if (gallery == null) {
          return const CenterProgressIndicator();
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                flexibleSpace: _buildPlaceholder(context, gallery),
                expandedHeight: 200,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    tooltip: 'Share',
                    onPressed: () {
                      Share.share(
                        client.getGalleryUrl(gallery.id),
                        subject: gallery.title,
                      );
                    },
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildBody(context, gallery),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlaceholder(BuildContext context, Gallery gallery) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: gallery.thumbnail,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).padding.top + 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, Gallery gallery) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GalleryHeader(gallery),
          const SizedBox(height: 8),
          _buildTitle(context, gallery),
          _buildSubtitle(context, gallery),
          _buildActions(context, gallery),
          _buildTags(context, gallery),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, Gallery gallery) {
    final theme = Theme.of(context);

    return Text(
      gallery.title,
      style: theme.textTheme.headline5,
    );
  }

  Widget _buildSubtitle(BuildContext context, Gallery gallery) {
    if (gallery.titleJpn == null || gallery.titleJpn.isEmpty) {
      return Container();
    }

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        gallery.titleJpn,
        style: theme.textTheme.subtitle2,
      ),
    );
  }

  Widget _buildActions(BuildContext context, Gallery gallery) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.play_arrow),
          label: const Text('Read'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              ViewScreen.routeName,
              arguments:
                  ViewScreenArguments((b) => b..id = gallery.id.toBuilder()),
            );
          },
        ),
        FlatButton.icon(
          icon: Icon(Icons.star_border),
          label: const Text('Fav'),
          onPressed: () {
            //
          },
        )
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 32);
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Text(
      title,
      style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.normal),
    );
  }

  Widget _buildTags(BuildContext context, Gallery gallery) {
    if (gallery.tags == null || gallery.tags.isEmpty) {
      return Container();
    }

    final theme = Theme.of(context);
    final groups = groupBy<GalleryTag, String>(
        gallery.tags, (tag) => tag.namespace.isEmpty ? 'misc' : tag.namespace);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildDivider(),
        _buildSectionTitle(context, 'Tags'),
        ...groups.entries.map((e) {
          return Row(
            children: <Widget>[
              Text(e.key, style: theme.textTheme.bodyText2),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 42,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Chip(label: Text(e.value[i].tag));
                    },
                    separatorBuilder: (context, i) => const SizedBox(width: 8),
                    itemCount: e.value.length,
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
