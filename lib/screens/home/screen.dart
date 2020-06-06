import 'package:flutter/material.dart';

import 'favorite_tab.dart';
import 'gallery_tab.dart';
import 'user_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  static const _widgets = <Widget>[
    GalleryTab(),
    FavoriteTab(),
    UserTab(),
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
      icon: Icon(Icons.person),
      title: Text('User'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _tabs.map((e) => e.title).elementAt(_currentTab),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: _widgets[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        onTap: _handleTabTapped,
        currentIndex: _currentTab,
      ),
    );
  }

  void _handleTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }
}
