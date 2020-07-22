import 'package:eh_redux/utils/firebase.dart';
import 'package:mobx/mobx.dart';

import 'screen.dart';

part 'store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int currentTab = 0;

  @observable
  DateTime bottomNavClickedAt;

  static const _tabName = <String>[
    'gallery',
    'favorite',
    'download',
    'history',
    'setting',
  ];

  @action
  void setCurrentTab(int value) {
    if (currentTab == value) return;

    currentTab = value;
    sendCurrentTabToAnalytics();
  }

  @action
  void updateBottomNavClickedTime() {
    bottomNavClickedAt = DateTime.now();
  }

  void sendCurrentTabToAnalytics() {
    analytics.setCurrentScreen(
      screenName: '${HomeScreen.routeName}/${_tabName[currentTab]}',
    );
  }
}
