import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
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

class GalleryScreen extends StatelessWidget {
  static String routeName = '/gallery';

  @override
  Widget build(BuildContext context) {
    final GalleryScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return Observer(
      builder: (context) {
        final gallery = galleryStore.data[args.id];

        if (gallery == null) {
          return CenterProgressIndicator();
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                flexibleSpace: _buildPlaceholder(context, gallery),
                expandedHeight: 200,
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
            label: Text('Read'),
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
    return CachedNetworkImage(
      imageUrl: gallery.thumbnail,
      fit: BoxFit.cover,
    );
  }

  Widget _buildBody(BuildContext context, Gallery gallery) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GalleryHeader(gallery),
          SizedBox(height: 8),
          _buildTitle(context, gallery),
          _buildSubtitle(context, gallery),
          Divider(),
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
      padding: EdgeInsets.only(top: 8),
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
        SizedBox(height: 8),
        Container(
          height: 36,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, i) => SizedBox(width: 8),
            itemBuilder: (context, i) {
              return Chip(label: Text(gallery.tags[i]));
            },
            itemCount: gallery.tags.length,
          ),
        ),
      ],
    );
  }
}
