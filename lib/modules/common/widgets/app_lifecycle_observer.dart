import 'package:flutter/widgets.dart';

class AppLifecycleObserver extends StatefulWidget {
  const AppLifecycleObserver({
    Key? key,
    required this.didChange,
    required this.child,
  }) : super(key: key);

  final void Function(AppLifecycleState) didChange;
  final Widget child;

  @override
  _AppLifecycleObserverState createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends State<AppLifecycleObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    widget.didChange(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
