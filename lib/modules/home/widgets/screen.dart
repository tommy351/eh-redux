import 'package:eh_redux/modules/home/store.dart';
import 'package:eh_redux/modules/home/tabs.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static String route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  PageController _pageController;
  HomeStore _homeStore;
  ReactionDisposer _dispose;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _homeStore = HomeStore();

    _dispose = reaction<int>((_) => _homeStore.currentTab, (currentTab) {
      _pageController.jumpToPage(currentTab);
    });
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
    _dispose();
    super.dispose();
  }

  @override
  void didPush() {
    super.didPush();
    _homeStore.sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _homeStore.sendCurrentTabToAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Provider.value(
      value: _homeStore,
      child: MediaQuery(
        data: mediaQuery.copyWith(
          padding: mediaQuery.padding + mediaQuery.viewInsets,
        ),
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            children: tabs.map((e) => e.widget(context)).toList(),
          ),
          bottomNavigationBar: const HomeBottomNav(),
        ),
      ),
    );
  }
}
