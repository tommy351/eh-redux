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
    this.storage = const FlutterSecureStorage(),
  });

  static const _sessionKey = 'session';

  final FlutterSecureStorage storage;

  @observable
  late ObservableFuture<String?> session =
      ObservableFuture(storage.read(key: _sessionKey));

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
    await storage.write(key: _sessionKey, value: value);
    session = ObservableFuture.value(value);
  }

  @action
  Future<void> deleteSession() async {
    await storage.delete(key: _sessionKey);
    session = ObservableFuture.value('');
  }
}
