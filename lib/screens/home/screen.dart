import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';

import 'favorite_tab.dart';
import 'gallery_tab.dart';
import 'setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  int _currentTab = 0;

  static const _widgets = <Widget>[
    GalleryTab(),
    FavoriteTab(),
    SettingTab(),
  ];

  static const _tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_library),
      title: Text('Gallery'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('Favorites'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('Settings'),
    ),
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

    return Scaffold(
      body: _widgets[_currentTab],
      bottomNavigationBar: MediaQuery(
        data: mediaQuery.copyWith(
          padding: mediaQuery.padding + mediaQuery.viewInsets,
        ),
        child: BottomNavigationBar(
          items: _tabs,
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
