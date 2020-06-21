import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key key}) : super(key: key);

  static const _paginationKey = GalleryPaginationKey.history();

  @override
  Widget build(BuildContext context) {
    final galleryStore = Provider.of<GalleryStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        galleryStore.refreshPage(_paginationKey);
        return () {};
      },
      builder: (context) {
        return NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              title: Text(S.of(context).history),
              pinned: true,
            ),
          ],
          body: const SafeArea(
            top: false,
            bottom: false,
            child: GalleryList(
              paginationKey: _paginationKey,
            ),
          ),
        );
      },
    );
  }
}
