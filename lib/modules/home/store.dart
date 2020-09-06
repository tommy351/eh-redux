import 'package:eh_redux/modules/home/widgets/screen.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:mobx/mobx.dart';

import 'tabs.dart';

part 'store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int currentTab = 0;

  @action
  void setCurrentTab(int value) {
    if (currentTab == value) return;

    assert(value < tabs.length);
    currentTab = value;
    sendCurrentTabToAnalytics();
  }

  void sendCurrentTabToAnalytics() {
    analytics.setCurrentScreen(
      screenName: '${HomeScreen.route}/${tabs[currentTab].name}',
    );
  }
}
