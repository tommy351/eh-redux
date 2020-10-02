import 'package:eh_redux/modules/home/store.dart';
import 'package:eh_redux/modules/home/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'bottom_nav.g.dart';

@swidget
Widget homeBottomNav(BuildContext context) {
  final homeStore = Provider.of<HomeStore>(context);
  final theme = Theme.of(context);

  return Observer(
    builder: (context) {
      final items = tabs
          .map((tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.title(context),
              ))
          .toList();

      return BottomNavigationBar(
        items: items,
        currentIndex: homeStore.currentTab,
        selectedItemColor: theme.accentColor,
        unselectedItemColor: theme.hintColor,
        onTap: (index) {
          homeStore.setCurrentTab(index);
          PrimaryScrollController.of(context).animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
          );
        },
      );
    },
  );
}
