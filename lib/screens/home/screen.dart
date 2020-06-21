import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';

import 'favorite_tab.dart';
import 'gallery_tab.dart';
import 'history_tab.dart';
import 'setting_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  int _currentTab = 0;

  static const _widgets = <Widget>[
    GalleryTab(),
    FavoriteTab(),
    HistoryTab(),
    SettingTab(),
  ];

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

    return Scaffold(
      body: _widgets[_currentTab],
      bottomNavigationBar: MediaQuery(
        data: mediaQuery.copyWith(
          padding: mediaQuery.padding + mediaQuery.viewInsets,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: tabs,
          onTap: _handleTabTapped,
          currentIndex: _currentTab,
        ),
      ),
    );
  }

  @override
  void didPush() {
    _sendCurrentTabToAnalytics(_currentTab);
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics(_currentTab);
  }

  void _handleTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
    _sendCurrentTabToAnalytics(index);
  }

  void _sendCurrentTabToAnalytics(int index) {
    analytics.setCurrentScreen(
      screenName: '${HomeScreen.routeName}homeTab$index',
    );
  }
}
