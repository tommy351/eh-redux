import 'package:flutter/material.dart';

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
    UserTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _widgets[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            title: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('User'),
          )
        ],
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
