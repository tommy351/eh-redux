import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'store.dart';

class ViewAppBar extends StatefulWidget implements PreferredSizeWidget {
  final EdgeInsets padding;

  @override
  final Size preferredSize;

  ViewAppBar({
    Key key,
    this.padding = EdgeInsets.zero,
  })  : preferredSize = Size.fromHeight(56 + padding.top),
        super(key: key);

  @override
  _ViewAppBarState createState() => _ViewAppBarState();
}

class _ViewAppBarState extends State<ViewAppBar> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewStore = Provider.of<ViewStore>(context);
    final imageStore = Provider.of<ImageStore>(context);
    final gallery = Provider.of<Gallery>(context);
    final client = Provider.of<EHentaiClient>(context);

    return StatefulWrapper(
      onInit: (context) {
        return reaction((_) => viewStore.navVisible, (bool visible) {
          if (visible) {
            _animationController.forward();
            SystemChrome.setEnabledSystemUIOverlays([
              SystemUiOverlay.top,
              SystemUiOverlay.bottom,
            ]);
          } else {
            _animationController.reverse();
            SystemChrome.setEnabledSystemUIOverlays([]);
          }
        });
      },
      builder: (context) {
        return FadeTransition(
          opacity: _animation,
          child: Observer(
            builder: (context) {
              final page = GalleryIdWithPage((b) => b
                ..galleryId = gallery.id.toBuilder()
                ..page = viewStore.currentPage + 1);
              final image = imageStore.data[imageStore.index[page]];

              return Container(
                padding: widget.padding,
                color: Colors.black.withOpacity(0.4),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                      '${viewStore.currentPage + 1} / ${gallery.fileCount}'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.share),
                      tooltip: 'Share',
                      onPressed: () {
                        if (image != null) {
                          Share.share(
                            client.getImageUrl(image.id),
                            subject: gallery.title,
                          );
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
