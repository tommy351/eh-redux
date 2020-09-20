import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BrightnessObserver extends StatefulWidget {
  const BrightnessObserver({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final Widget Function(BuildContext, Brightness) builder;

  @override
  _BrightnessObserverState createState() => _BrightnessObserverState();
}

class _BrightnessObserverState extends State<BrightnessObserver>
    with WidgetsBindingObserver {
  Brightness _brightness;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _update();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState(() {
      _update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _brightness);
  }

  void _update() {
    _brightness = WidgetsBinding.instance.window.platformBrightness;
  }
}
