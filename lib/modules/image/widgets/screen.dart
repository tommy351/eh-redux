import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/common/widgets/app_lifecycle_observer.dart';
import 'package:eh_redux/modules/common/widgets/orientation_setter.dart';
import 'package:eh_redux/modules/common/widgets/stateful_wrapper.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/image/store.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
import 'body.dart';
import 'bottom_nav.dart';
import 'system_overlay_setter.dart';

part 'screen.g.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({
    Key? key,
    required this.gallery,
  }) : super(key: key);

  static const route = '/image';

  final Gallery gallery;

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late ImageStore _store;

  @override
  void initState() {
    super.initState();

    final database = Provider.of<Database>(context, listen: false);
    _store = ImageStore(
      client: Provider.of<EHentaiClient>(context, listen: false),
      galleriesDao: database.galleriesDao,
      downloadedImagesDao: database.downloadedImagesDao,
      gallery: widget.gallery,
    )..loadReadPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _store,
      child: const _Content(),
    );
  }
}

@swidget
Widget _content(BuildContext context) {
  final store = Provider.of<ImageStore>(context);
  final mediaQuery = MediaQuery.of(context);
  final theme = Theme.of(context);

  return StatefulWrapper(
    onDispose: () {
      store.saveReadPosition();
    },
    builder: (context) {
      return AppLifecycleObserver(
        didChange: (state) {
          if (state == AppLifecycleState.paused) {
            store.saveReadPosition();
          }
        },
        child: SystemOverlaySetter(
          child: OrientationSetter(
            child: MediaQuery(
              data: mediaQuery.copyWith(
                padding: EdgeInsets.zero,
                viewPadding: EdgeInsets.zero,
                viewInsets: EdgeInsets.zero,
              ),
              child: Theme(
                data: ThemeData.dark().copyWith(
                  accentColor: theme.accentColor,
                  scaffoldBackgroundColor: Colors.black,
                  sliderTheme: theme.sliderTheme,
                ),
                child: Scaffold(
                  extendBody: true,
                  extendBodyBehindAppBar: true,
                  appBar: ImageAppBar(
                    padding: mediaQuery.viewInsets == EdgeInsets.zero
                        ? mediaQuery.padding
                        : EdgeInsets.only(top: mediaQuery.padding.top),
                  ),
                  body: const _Body(),
                  bottomNavigationBar: ImageBottomNav(
                    padding: mediaQuery.viewInsets == EdgeInsets.zero
                        ? mediaQuery.padding.copyWith(top: 0)
                        : mediaQuery.viewInsets,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

@swidget
Widget _body(BuildContext context) {
  final store = Provider.of<ImageStore>(context);

  return Observer(
    builder: (context) {
      if (!store.readPositionLoaded) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return const ImageBody();
    },
  );
}
