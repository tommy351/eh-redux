import 'package:eh_redux/modules/image/store.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class SystemOverlaySetter extends StatefulWidget {
  const SystemOverlaySetter({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _SystemOverlaySetterState createState() => _SystemOverlaySetterState();
}

class _SystemOverlaySetterState extends State<SystemOverlaySetter> {
  ReactionDisposer _dispose;

  @override
  void initState() {
    super.initState();

    final store = Provider.of<ImageStore>(context, listen: false);

    _hideOverlays(logEvent: false);

    _dispose = reaction<bool>((_) => store.navVisible, (visible) {
      if (visible) {
        _showOverlays();
      } else {
        _hideOverlays();
      }
    });
  }

  @override
  void dispose() {
    _dispose();
    _showOverlays(logEvent: false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _hideOverlays({bool logEvent = true}) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    if (logEvent) {
      analytics.logEvent(name: 'hide_view_screen_ui');
    }
  }

  void _showOverlays({bool logEvent = true}) {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    if (logEvent) {
      analytics.logEvent(name: 'show_view_screen_ui');
    }
  }
}
