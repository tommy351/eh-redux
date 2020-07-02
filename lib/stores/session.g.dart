// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionStore on _SessionStoreBase, Store {
  Computed<LoginStatus> _$loginStatusComputed;

  @override
  LoginStatus get loginStatus =>
      (_$loginStatusComputed ??= Computed<LoginStatus>(() => super.loginStatus,
              name: '_SessionStoreBase.loginStatus'))
          .value;

  final _$sessionAtom = Atom(name: '_SessionStoreBase.session');

  @override
  ObservableFuture<String> get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(ObservableFuture<String> value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
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
loginStatus: ${loginStatus}
    ''';
  }
}
