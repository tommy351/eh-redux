import 'dart:async';

import 'package:eh_redux/modules/setting/store.dart';
import 'package:eh_redux/modules/setting/types.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OrientationSetter extends StatefulWidget {
  const OrientationSetter({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _OrientationSetterState createState() => _OrientationSetterState();
}

class _OrientationSetterState extends State<OrientationSetter> {
  StreamSubscription<OrientationSetting> _subscription;

  @override
  void initState() {
    super.initState();

    final store = Provider.of<SettingStore>(context, listen: false);
    _subscription = store.orientation.listen((value) {
      _updateOrientation(value);
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _updateOrientation(OrientationSetting.auto);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _updateOrientation(OrientationSetting orientation) {
    switch (orientation) {
      case OrientationSetting.portrait:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        break;

      case OrientationSetting.landscape:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
        break;

      default:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
    }
  }
}
