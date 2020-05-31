import 'package:ehreader/screens/gallery_list.dart';
import 'package:ehreader/screens/user.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  static const _widgets = <Widget>[
    GalleryListScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
