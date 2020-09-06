import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/image/store.dart';
import 'package:eh_redux/modules/image/types.dart';
import 'package:eh_redux/modules/setting/widgets/screen.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'animated_navigation.dart';

part 'app_bar.g.dart';

enum _PopupAction {
  settings,
  openInBrowser,
}

class ImageAppBar extends StatelessWidget implements PreferredSizeWidget {
  ImageAppBar({
    Key key,
    this.padding = EdgeInsets.zero,
  })  : preferredSize = Size.fromHeight(56 + padding.top),
        super(key: key);

  final EdgeInsets padding;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ImageStore>(context);

    return AnimatedNavigation(
      child: Observer(
        builder: (context) {
          return Container(
            padding: padding,
            color: Colors.black.withOpacity(0.4),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                ..._getActions(store.currentImage),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _getActions(GalleryImage image) {
    if (image == null) return [];

    return [
      _ShareButton(image: image),
      _PopupButton(image: image),
    ];
  }
}

@swidget
Widget _shareButton(
  BuildContext context, {
  @required GalleryImage image,
}) {
  final store = Provider.of<ImageStore>(context);

  return IconButton(
    icon: const Icon(Icons.share),
    tooltip: S.of(context).shareButtonTooltip,
    onPressed: () {
      store.share(image);
    },
  );
}

@swidget
Widget _popupButton(
  BuildContext context, {
  @required GalleryImage image,
}) {
  final store = Provider.of<ImageStore>(context);

  return PopupMenuButton<_PopupAction>(
    onSelected: (action) {
      switch (action) {
        case _PopupAction.settings:
          Navigator.pushNamed(context, SettingScreen.route);
          break;

        case _PopupAction.openInBrowser:
          tryLaunch(store.getUri(image).toString());
          break;
      }
    },
    itemBuilder: (context) => [
      PopupMenuItem(
        value: _PopupAction.settings,
        child: Text(S.of(context).imageActionSettings),
      ),
      PopupMenuItem(
        value: _PopupAction.openInBrowser,
        child: Text(S.of(context).imageActionOpenInBrowser),
      ),
    ],
  );
}
