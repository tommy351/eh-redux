import 'dart:async';
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

  Function listen(List<KeyCode> keys, KeyEventCallback callback) {
    _interceptKeyDown(keys);

    final sub = _keyDownEventChannel.receiveBroadcastStream().listen((event) {
      final code = KeyCode.valueOf(event as String);

      if (code != null && keys.contains(code)) {
        callback(code);
      }
    });

    return () {
      _uninterceptKeyDown(keys);
      sub.cancel();
    };
  }

  Future<void> _interceptKeyDown(List<KeyCode> keys) async {
    for (final key in keys) {
      await _methodChannel.invokeMethod('interceptKeyDown', key.toString());
      developer.log('Intercept key down: $key');
    }
  }

  Future<void> _uninterceptKeyDown(List<KeyCode> keys) async {
    for (final key in keys) {
      await _methodChannel.invokeMethod('uninterceptKeyDown', key.toString());
      developer.log('Unintercept key down: $key');
    }
  }
}
