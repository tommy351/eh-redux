import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'store.dart';
import 'widgets/bottom_nav.dart';
import 'widgets/download_tab.dart';
import 'widgets/favorite_tab.dart';
import 'widgets/gallery_tab.dart';
import 'widgets/history_tab.dart';
import 'widgets/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  HomeStore _homeStore;

  static const _widgets = <Widget>[
    GalleryTab(),
    FavoriteTab(),
    DownloadTab(),
    HistoryTab(),
    SettingTab(),
  ];

  @override
  void initState() {
    super.initState();
    _homeStore = HomeStore();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    firebaseAnalyticsObserver.subscribe(
      this,
      ModalRoute.of(context) as PageRoute,
    );
  }

  @override
  void dispose() {
    firebaseAnalyticsObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _homeStore,
      child: Scaffold(
        body: Observer(
          builder: (context) {
            return _widgets[_homeStore.currentTab];
          },
        ),
        bottomNavigationBar: const HomeBottomNav(),
      ),
    );
  }

  @override
  void didPush() {
    _homeStore.sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _homeStore.sendCurrentTabToAnalytics();
  }
}
