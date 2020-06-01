import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/gallery/args.dart';
import 'package:ehreader/screens/gallery/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:ehreader/widgets/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _GalleryTabContent(
      galleryStore: Provider.of<GalleryStore>(context),
    );
  }
}

class _GalleryTabContent extends StatefulWidget {
  final GalleryStore galleryStore;

  _GalleryTabContent({
    @required this.galleryStore,
  }) : assert(galleryStore != null);

  @override
  State createState() => _GalleryTabContentState(galleryStore: galleryStore);
}

class _GalleryTabContentState extends State<_GalleryTabContent> {
  final GalleryStore galleryStore;
  final _paginationKey = GalleryPaginationKey();
  ScrollController _scrollController;

  _GalleryTabContentState({
    @required this.galleryStore,
  }) : assert(galleryStore != null);

  @override
  void initState() {
    super.initState();
    galleryStore.loadInitialPage(_paginationKey);
    _scrollController = ScrollController()..addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final pagination = galleryStore.paginations[_paginationKey];

        if (pagination == null ||
            (pagination.index.isEmpty && pagination.loading)) {
          return CenterProgressIndicator();
        }

        final galleries = galleryStore.data.values
            .where((element) => pagination.index.contains(element.id));

        return ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, i) {
            if (i >= galleries.length) {
              return CenterProgressIndicator();
            }

            return _buildRow(context, galleries.elementAt(i));
          },
          separatorBuilder: (context, i) => Divider(height: 1),
          itemCount:
              pagination.noMore ? galleries.length : galleries.length + 1,
        );
      },
    );
  }

  Widget _buildRow(BuildContext context, Gallery gallery) {
    final ThemeData theme = Theme.of(context);
    final thumbSize = 92.0;

    return InkWell(
      child: Row(
        key: Key('${gallery.id.id}'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: gallery.thumbnail,
            width: thumbSize,
            height: thumbSize,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '${gallery.category} / ${gallery.fileCount}P',
                            style: theme.textTheme.caption,
                          ),
                        ),
                        Text(
                          '${gallery.rating}',
                          style: theme.textTheme.caption,
                        ),
                        RatingBar(
                          gallery.rating,
                          size: 16,
                          color: theme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    gallery.title,
                    style: theme.textTheme.subtitle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, GalleryScreen.routeName,
            arguments:
                GalleryScreenArguments((b) => b..id = gallery.id.toBuilder()));
      },
    );
  }

  void _handleScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= 200) {
      galleryStore.loadNextPage(_paginationKey);
    }
  }
}
