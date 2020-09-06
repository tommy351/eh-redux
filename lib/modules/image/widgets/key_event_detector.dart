import 'package:eh_redux/utils/key_event.dart';
import 'package:flutter/material.dart';

class KeyEventDetector extends StatefulWidget {
  const KeyEventDetector({
    Key key,
    @required this.child,
    @required this.onPrevious,
    @required this.onNext,
  })  : assert(child != null),
        assert(onPrevious != null),
        assert(onNext != null),
        super(key: key);

  final Widget child;
  final void Function() onPrevious;
  final void Function() onNext;

  @override
  _KeyEventDetectorState createState() => _KeyEventDetectorState();
}

class _KeyEventDetectorState extends State<KeyEventDetector> {
  KeyEventListener _listener;
  Function _dispose;

  @override
  void initState() {
    super.initState();
    _listener = KeyEventListener();
  }

  @override
  void dispose() {
    _setupListener(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _setupListener(bool enabled) {
    if (enabled) {
      if (_dispose != null) return;

      _dispose = _listener.listen([
        KeyCode.volumeDown,
        KeyCode.volumeUp,
      ], _handleKeyEvent);
    } else {
      if (_dispose != null) {
        _dispose();
        _dispose = null;
      }
    }
  }

  void _handleKeyEvent(KeyCode code) {
    switch (code) {
      case KeyCode.volumeDown:
        widget.onNext();
        break;
      case KeyCode.volumeUp:
        widget.onPrevious();
        break;
    }
  }
}
