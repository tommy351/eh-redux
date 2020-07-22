import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/stores/setting.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:eh_redux/tables/gallery.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'args.dart';
import 'store.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';
import 'widgets/bottom_nav.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key key}) : super(key: key);

  static String routeName = '/view';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as ViewScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);
    final database = Provider.of<Database>(context);

    return Observer(
      builder: (context) {
        final gallery = galleryStore.data[args.id];

        if (gallery == null) {
          return const CenterProgressIndicator();
        }

        return Provider.value(
          value: gallery,
          child: _ViewScreenContent(
            gallery: gallery,
            galleriesDao: database.galleriesDao,
          ),
        );
      },
    );
  }
}

class _ViewScreenContent extends StatefulWidget {
  const _ViewScreenContent({
    Key key,
    @required this.galleriesDao,
    @required this.gallery,
  })  : assert(galleriesDao != null),
        assert(gallery != null),
        super(key: key);

  final GalleriesDao galleriesDao;
  final Gallery gallery;

  @override
  _ViewScreenContentState createState() => _ViewScreenContentState();
}

class _ViewScreenContentState extends State<_ViewScreenContent>
    with WidgetsBindingObserver {
  ViewStore _viewStore;
  Future<GalleryReadPosition> _loadReadPositionFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _viewStore = ViewStore(
      galleriesDao: widget.galleriesDao,
      galleryId: widget.gallery.id,
    );
    _loadReadPositionFuture = _viewStore.loadReadPosition();
  }

  @override
  void dispose() {
    _viewStore.saveReadPosition();
    _updateOrientation(OrientationSetting.auto);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      _viewStore.saveReadPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final settingStore = Provider.of<SettingStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        return autorun(
            (_) => _updateOrientation(settingStore.orientation.value));
      },
      builder: (context) {
        return Provider(
          create: (_) => _viewStore,
          child: MediaQuery(
            data: mediaQuery.copyWith(
              padding: EdgeInsets.zero,
              viewPadding: EdgeInsets.zero,
              viewInsets: EdgeInsets.zero,
            ),
            child: _buildScaffold(),
          ),
        );
      },
    );
  }

  Widget _buildScaffold() {
    final mediaQuery = MediaQuery.of(context);

    return FutureBuilder<GalleryReadPosition>(
      future: _loadReadPositionFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: ViewAppBar(
            padding: mediaQuery.viewInsets == EdgeInsets.zero
                ? mediaQuery.padding
                : EdgeInsets.only(top: mediaQuery.padding.top),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: ViewBody(
            initialPage: snapshot.data.page ?? 0,
          ),
          bottomNavigationBar: ViewBottomNavigation(
            padding: mediaQuery.viewInsets == EdgeInsets.zero
                ? mediaQuery.padding.copyWith(top: 0)
                : mediaQuery.viewInsets,
          ),
        );
      },
    );
  }

  void _updateOrientation(OrientationSetting orientation) {
    switch (orientation) {
      case OrientationSetting.portrait:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        break;

      case OrientationSetting.landscape:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
        break;

      default:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
    }
  }
}
