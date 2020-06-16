import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'session.g.dart';

enum LoginStatus {
  pending,
  notLoggedIn,
  loggedIn,
}

class SessionStore = _SessionStoreBase with _$SessionStore;

abstract class _SessionStoreBase with Store {
  _SessionStoreBase({
    @required this.secureStorage,
  })  : assert(secureStorage != null),
        session = ObservableFuture(secureStorage.read(key: _sessionKey));

  static const _sessionKey = 'session';
  static final _emptySession = ObservableFuture.value('');

  final FlutterSecureStorage secureStorage;

  @observable
  ObservableFuture<String> session;

  @computed
  LoginStatus get loginStatus {
    if (session.value != null && session.value.isNotEmpty) {
      return LoginStatus.loggedIn;
    }

    return session.status == FutureStatus.pending
        ? LoginStatus.pending
        : LoginStatus.notLoggedIn;
  }

  @action
  Future<void> setSession(String value) async {
    await secureStorage.write(key: _sessionKey, value: value);
    session = ObservableFuture.value(value);
  }

  @action
  Future<void> deleteSession() async {
    await secureStorage.delete(key: _sessionKey);
    session = _emptySession;
  }
}
