import 'package:eh_redux/modules/home/store.dart';
import 'package:eh_redux/modules/home/tabs.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'bottom_nav.dart';

part 'screen.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static String route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  final _homeStore = HomeStore();

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
        child: const Scaffold(
          body: _Body(),
          bottomNavigationBar: HomeBottomNav(),
        ),
      ),
    );
  }
}

@swidget
Widget _body(BuildContext context) {
  final homeStore = Provider.of<HomeStore>(context);

  return Observer(
    builder: (context) {
      return tabs[homeStore.currentTab].widget(context);
    },
  );
}
