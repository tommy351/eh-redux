// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionStore on _SessionStoreBase, Store {
  Computed<bool> _$loggedInComputed;

  @override
  bool get loggedIn =>
      (_$loggedInComputed ??= Computed<bool>(() => super.loggedIn,
              name: '_SessionStoreBase.loggedIn'))
          .value;

  final _$sessionAtom = Atom(name: '_SessionStoreBase.session');

  @override
  String get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(String value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
  }

  final _$loadSessionAsyncAction = AsyncAction('_SessionStoreBase.loadSession');

  @override
  Future<void> loadSession() {
    return _$loadSessionAsyncAction.run(() => super.loadSession());
  }

  final _$setSessionAsyncAction = AsyncAction('_SessionStoreBase.setSession');

  @override
  Future<void> setSession(String value) {
    return _$setSessionAsyncAction.run(() => super.setSession(value));
  }

  final _$deleteSessionAsyncAction =
      AsyncAction('_SessionStoreBase.deleteSession');

  @override
  Future<void> deleteSession() {
    return _$deleteSessionAsyncAction.run(() => super.deleteSession());
  }

  @override
  String toString() {
    return '''
session: ${session},
loggedIn: ${loggedIn}
    ''';
  }
}
