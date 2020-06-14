import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryInfo extends StatelessWidget {
  const GalleryInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final theme = Theme.of(context);

    return Padding(
      padding: MediaQuery.of(context).padding.copyWith(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Info',
              style: theme.textTheme.headline6
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
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
                  title: const Text('Uploader'),
                  trailing: Text(gallery.uploader),
                ),
              ),
              _buildTile(
                context: context,
                title: const Text('Length'),
                trailing: Text('${gallery.fileCount} pages'),
              ),
              _buildTile(
                context: context,
                title: const Text('File Size'),
                trailing: Text(filesize(gallery.fileSize)),
              ),
            ],
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
