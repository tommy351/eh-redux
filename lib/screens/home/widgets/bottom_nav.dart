import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/home/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context);
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
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
        icon: const Icon(Icons.file_download),
        title: Text(S.of(context).downloads),
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

    return MediaQuery(
      data: mediaQuery.copyWith(
        padding: mediaQuery.padding + mediaQuery.viewInsets,
      ),
      child: Observer(
        builder: (context) {
          return BottomNavigationBar(
            items: tabs,
            currentIndex: homeStore.currentTab,
            selectedItemColor: theme.accentColor,
            unselectedItemColor: theme.hintColor,
            onTap: (index) {
              homeStore.setCurrentTab(index);
              homeStore.updateBottomNavClickedTime();
            },
          );
        },
      ),
    );
  }
}
