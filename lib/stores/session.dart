import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'session.g.dart';

class SessionStore = _SessionStoreBase with _$SessionStore;

abstract class _SessionStoreBase with Store {
  static const _sessionKey = 'session';

  final FlutterSecureStorage secureStorage;

  @observable
  String session;

  @computed
  bool get loggedIn => session != null && session.isNotEmpty;

  _SessionStoreBase({
    @required this.secureStorage,
  }) : assert(secureStorage != null);

  @action
  Future<void> loadSession() async {
    session = await secureStorage.read(key: _sessionKey);
  }

  @action
  Future<void> setSession(String value) async {
    await secureStorage.write(key: _sessionKey, value: value);
    session = value;
  }

  @action
  Future<void> deleteSession() async {
    await secureStorage.delete(key: _sessionKey);
    session = null;
  }
}
