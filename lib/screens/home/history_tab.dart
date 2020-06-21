import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          paginationKey: GalleryPaginationKey.history(),
        ),
      ),
    );
  }
}
