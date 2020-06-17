import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/gallery/args.dart';
import 'package:eh_redux/screens/gallery/screen.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/stores/setting.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/gallery_header.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({
    Key key,
    @required this.paginationKey,
  })  : assert(paginationKey != null),
        super(key: key);

  final GalleryPaginationKey paginationKey;

  @override
  _GalleryListState createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  @override
  void initState() {
    super.initState();
    _loadInitialPage();
  }

  @override
  void didUpdateWidget(GalleryList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.paginationKey != widget.paginationKey) {
      _loadInitialPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final galleryStore = Provider.of<GalleryStore>(context);
    final theme = Theme.of(context);
    final scrollController = PrimaryScrollController.of(context);

    return StatefulWrapper(
      onInit: (context) {
        void handleScroll() {
          final position = scrollController.position;

          if (position.maxScrollExtent - position.pixels <= 200) {
            galleryStore.loadNextPage(widget.paginationKey);
          }
        }

        scrollController.addListener(handleScroll);

        return () {
          scrollController.removeListener(handleScroll);
        };
      },
      builder: (context) => Observer(
        builder: (context) {
          final pagination = galleryStore.paginations[widget.paginationKey];

          if (pagination == null) {
            return const CenterProgressIndicator();
          }

          final index = pagination.index;

          if (index.isEmpty) {
            if (pagination.loading) {
              return const CenterProgressIndicator();
            }

            return Center(
              child: Text(S.of(context).galleryListEmpty,
                  style: theme.textTheme.headline6),
            );
          }

          final galleries = index
              .map((id) => galleryStore.data[id])
              .where((element) => element != null);

          return RefreshIndicator(
            onRefresh: () async {
              await galleryStore.refreshPage(widget.paginationKey);
            },
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                if (i >= galleries.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CenterProgressIndicator(),
                  );
                }

                return _buildRow(galleries.elementAt(i));
              },
              itemCount:
                  pagination.noMore ? galleries.length : galleries.length + 1,
            ),
          );
        },
      ),
    );
  }

  void _loadInitialPage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final galleryStore = Provider.of<GalleryStore>(context, listen: false);
      galleryStore.loadInitialPage(widget.paginationKey);
    });
  }

  Widget _buildRow(Gallery gallery) {
    const thumbWidth = 112.0;
    const thumbHeight = 112.0;

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
                            child: _buildTitle(gallery),
                          ),
                          _buildTagList(gallery.tags),
                          const SizedBox(height: 8),
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

  Widget _buildTitle(Gallery gallery) {
    final theme = Theme.of(context);
    final settingStore = Provider.of<SettingStore>(context);

    return Observer(
      builder: (context) {
        final displayJapaneseTitle =
            settingStore.displayJapaneseTitle.value ?? false;

        return Text(
          displayJapaneseTitle && gallery.titleJpn.isNotEmpty
              ? gallery.titleJpn
              : gallery.title,
          style: theme.textTheme.subtitle1,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  Widget _buildTagList(BuiltList<GalleryTag> tags) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.caption;

    return SizedBox(
      height: 16,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, i) => Text(', ', style: textStyle),
        itemBuilder: (context, i) {
          return Text(tags.elementAt(i).shortTag(), style: textStyle);
        },
        itemCount: tags.length,
      ),
    );
  }
}
