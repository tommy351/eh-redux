import 'dart:async';
import 'dart:collection';
import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/services.dart';

part 'key_event.g.dart';

class KeyCode extends EnumClass {
  const KeyCode._(String name) : super(name);

  static const KeyCode volumeDown = _$volumeDown;
  static const KeyCode volumeUp = _$volumeUp;

  static BuiltSet<KeyCode> get values => _$keyCodeValues;
  static KeyCode valueOf(String name) => _$keyCodeValueOf(name);
}

typedef KeyEventCallback = Function(KeyCode);

class KeyEventListener {
  static const _methodChannel = MethodChannel('app.ehredux/method');
  static const _keyDownEventChannel = EventChannel('app.ehredux/event/keyDown');

  final _interceptedKeys = HashSet<KeyCode>();
  final _subscriptions = <StreamSubscription>[];

  Future<void> listenKeyDown(
      List<KeyCode> keys, KeyEventCallback callback) async {
    for (final key in keys) {
      await _methodChannel.invokeMethod('interceptKeyDown', key.toString());
      developer.log('Intercept key down: $key');
      _interceptedKeys.add(key);
    }

    final subscription =
        _keyDownEventChannel.receiveBroadcastStream().listen((event) {
      callback(KeyCode.valueOf(event as String));
    });

    _subscriptions.add(subscription);
  }

  Future<void> dispose() async {
    for (final key in _interceptedKeys) {
      await _methodChannel.invokeMethod('uninterceptKeyDown', key.toString());
      developer.log('Unintercept key down: $key');
    }

    for (final sub in _subscriptions) {
      await sub.cancel();
    }
  }
}
