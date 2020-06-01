import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/gallery/args.dart';
import 'package:ehreader/screens/gallery/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GalleryListScreen extends StatelessWidget {
  const GalleryListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _GalleryListContent(
      galleryStore: Provider.of<GalleryStore>(context),
    );
  }
}

class _GalleryListContent extends StatefulWidget {
  final GalleryStore galleryStore;

  _GalleryListContent({
    @required this.galleryStore,
  }) : assert(galleryStore != null);

  @override
  State createState() => _GalleryListContentState(galleryStore: galleryStore);
}

class _GalleryListContentState extends State<_GalleryListContent> {
  final GalleryStore galleryStore;
  final _paginationKey = GalleryPaginationKey();
  ScrollController _scrollController;

  _GalleryListContentState({
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
          separatorBuilder: (context, i) => Divider(),
          itemCount:
              pagination.noMore ? galleries.length : galleries.length + 1,
        );
      },
    );
  }

  Widget _buildRow(BuildContext context, Gallery gallery) {
    return ListTile(
      key: Key('${gallery.id.id}'),
      title: Text(gallery.title),
      subtitle: Text(gallery.titleJpn),
      contentPadding: EdgeInsets.all(0),
      leading: CachedNetworkImage(
        imageUrl: gallery.thumbnail,
        width: 80,
        fit: BoxFit.cover,
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          GalleryScreen.routeName,
          arguments:
              GalleryScreenArguments((b) => b..id = gallery.id.toBuilder()),
        );
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
