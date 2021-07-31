import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

enum LoginStatus {
  pending,
  notLoggedIn,
  loggedIn,
}

class SessionStore = _SessionStoreBase with _$SessionStore;

abstract class _SessionStoreBase with Store {
  _SessionStoreBase({
    FlutterSecureStorage? storage,
  }) {
    _storage = storage ?? const FlutterSecureStorage();
    session = ObservableFuture(_storage.read(key: _sessionKey));
  }

  static const _sessionKey = 'session';

  late FlutterSecureStorage _storage;

  @observable
  late ObservableFuture<String?> session;

  @computed
  LoginStatus get loginStatus {
    if (session.value?.isNotEmpty ?? false) {
      return LoginStatus.loggedIn;
    }

    return session.status == FutureStatus.pending
        ? LoginStatus.pending
        : LoginStatus.notLoggedIn;
  }

  @action
  Future<void> setSession(String value) async {
    await _storage.write(key: _sessionKey, value: value);
    session = ObservableFuture.value(value);
  }

  @action
  Future<void> deleteSession() async {
    await _storage.delete(key: _sessionKey);
    session = ObservableFuture.value('');
  }
}
