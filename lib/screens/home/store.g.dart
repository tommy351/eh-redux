// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$currentTabAtom = Atom(name: '_HomeStoreBase.currentTab');

  @override
  int get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  final _$bottomNavClickedAtAtom =
      Atom(name: '_HomeStoreBase.bottomNavClickedAt');

  @override
  DateTime get bottomNavClickedAt {
    _$bottomNavClickedAtAtom.reportRead();
    return super.bottomNavClickedAt;
  }

  @override
  set bottomNavClickedAt(DateTime value) {
    _$bottomNavClickedAtAtom.reportWrite(value, super.bottomNavClickedAt, () {
      super.bottomNavClickedAt = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setCurrentTab(int value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setCurrentTab');
    try {
      return super.setCurrentTab(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBottomNavClickedTime() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateBottomNavClickedTime');
    try {
      return super.updateBottomNavClickedTime();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab},
bottomNavClickedAt: ${bottomNavClickedAt}
    ''';
  }
}
