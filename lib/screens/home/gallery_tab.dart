import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/gallery/args.dart';
import 'package:ehreader/screens/gallery/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:ehreader/widgets/gallery_header.dart';
import 'package:ehreader/widgets/stateful_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({Key key}) : super(key: key);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  final _paginationKey = GalleryPaginationKey();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final galleryStore = Provider.of<GalleryStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        galleryStore.loadInitialPage(_paginationKey);
        return () => {};
      },
      builder: (context) {
        return Observer(
          builder: (context) {
            final pagination = galleryStore.paginations[_paginationKey];

            if (pagination == null ||
                (pagination.index.isEmpty && pagination.loading)) {
              return const CenterProgressIndicator();
            }

            final galleries = galleryStore.data.values
                .where((element) => pagination.index.contains(element.id));

            return ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, i) {
                if (i >= galleries.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CenterProgressIndicator(),
                  );
                }

                return _buildRow(context, galleries.elementAt(i));
              },
              itemCount:
                  pagination.noMore ? galleries.length : galleries.length + 1,
            );
          },
        );
      },
    );
  }

  Widget _buildRow(BuildContext context, Gallery gallery) {
    final theme = Theme.of(context);
    const thumbWidth = 112.0;
    const thumbHeight = 88.0;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, GalleryScreen.routeName,
            arguments:
                GalleryScreenArguments((b) => b..id = gallery.id.toBuilder()));
      },
      child: Row(
        key: Key('${gallery.id.id}'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: gallery.thumbnail,
            width: thumbWidth,
            height: thumbHeight,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              height: thumbHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              gallery.title,
                              style: theme.textTheme.subtitle1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GalleryHeader(gallery),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= 200) {
      final galleryStore = Provider.of<GalleryStore>(context, listen: false);
      galleryStore.loadNextPage(_paginationKey);
    }
  }
}
