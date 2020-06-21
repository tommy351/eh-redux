import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/home/store.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'favorite_tab.dart';
import 'gallery_tab.dart';
import 'history_tab.dart';
import 'setting_tab.dart';

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
        this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    firebaseAnalyticsObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Provider.value(
      value: _homeStore,
      child: Scaffold(
        body: Observer(
          builder: (context) {
            return _widgets[_homeStore.currentTab];
          },
        ),
        bottomNavigationBar: MediaQuery(
          data: mediaQuery.copyWith(
            padding: mediaQuery.padding + mediaQuery.viewInsets,
          ),
          child: _buildBottomNav(),
        ),
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

  Widget _buildBottomNav() {
    final tabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.photo_library),
        title: Text(S.of(context).gallery),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite),
        title: Text(S.of(context).favorites),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.history),
        title: Text(S.of(context).history),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.settings),
        title: Text(S.of(context).settings),
      ),
    ];

    return Observer(
      builder: (context) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: tabs,
          currentIndex: _homeStore.currentTab,
          onTap: (index) {
            _homeStore.setCurrentTab(index);
            _homeStore.updateBottomNavClickedTime();
          },
        );
      },
    );
  }
}
