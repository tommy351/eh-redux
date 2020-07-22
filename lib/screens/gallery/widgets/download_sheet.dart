import 'package:eh_redux/generated/l10n.dart';
import 'package:flutter/material.dart';

class GalleryDownloadSheet extends StatelessWidget {
  const GalleryDownloadSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Set proper height for the bottom sheet
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.pause),
          title: Text(S.of(context).pause),
        ),
        ListTile(
          leading: const Icon(Icons.play_arrow),
          title: Text(S.of(context).resume),
        ),
        ListTile(
          leading:const Icon(Icons.cancel),
          title: Text(S.of(context).cancel),
        ),
        ListTile(
          leading:const Icon(Icons.delete),
          title: Text(S.of(context).delete),
        ),
      ],
    );
  }
}
