import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/gallery/title.dart';
import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GalleryInfo extends StatelessWidget {
  const GalleryInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);

    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed([
          GallerySectionTitle(
            title: Text(S.of(context).info),
          ),
          _buildTile(
            context: context,
            title: Text(S.of(context).postedTime),
            trailing: Text(DateFormat.yMMMd().add_Hm().format(gallery.posted)),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SearchScreen.routeName,
                arguments: SearchScreenArguments(
                    (b) => b.query = 'uploader:${gallery.uploader}'),
              );
            },
            child: _buildTile(
              context: context,
              title: Text(S.of(context).uploader),
              trailing: Text(gallery.uploader),
            ),
          ),
          _buildTile(
            context: context,
            title: Text(S.of(context).galleryLength),
            trailing: Text(S.of(context).galleryPageCount(gallery.fileCount)),
          ),
          _buildTile(
            context: context,
            title: Text(S.of(context).fileSize),
            trailing: Text(filesize(gallery.fileSize)),
          ),
        ]),
      ),
    );
  }

  Widget _buildTile({
    @required BuildContext context,
    @required Widget title,
    @required Widget trailing,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DefaultTextStyle(
              style: theme.textTheme.bodyText2
                  .copyWith(color: theme.textTheme.caption.color),
              child: title,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
