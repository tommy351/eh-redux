import 'package:cached_network_image/cached_network_image.dart';
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
                floating: true,
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
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.chevron_right),
            label: const Text('Read'),
            backgroundColor: Colors.pinkAccent,
            onPressed: () {
              Navigator.pushNamed(
                context,
                ViewScreen.routeName,
                arguments:
                    ViewScreenArguments((b) => b..id = gallery.id.toBuilder()),
              );
            },
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
          const Divider(),
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

  Widget _buildTags(BuildContext context, Gallery gallery) {
    if (gallery.tags == null || gallery.tags.isEmpty) {
      return Container();
    }

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tags',
          style: theme.textTheme.bodyText1,
        ),
        const SizedBox(height: 8),
        Container(
          height: 36,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, i) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              return Chip(label: Text(gallery.tags[i].fullTag()));
            },
            itemCount: gallery.tags.length,
          ),
        ),
      ],
    );
  }
}
