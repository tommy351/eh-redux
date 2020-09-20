import 'package:flutter/widgets.dart';

class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    Key key,
    @required this.builder,
    this.onInit,
    this.onDispose,
  })  : assert(builder != null),
        super(key: key);

  final Widget Function(BuildContext) builder;
  final Function Function(BuildContext) onInit;
  final void Function() onDispose;

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  final _disposes = <Function>[];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.onInit != null) {
        _disposes.add(widget.onInit(context));
      }
    });
  }

  @override
  void dispose() {
    for (final dispose in _disposes) {
      dispose();
    }

    if (widget.onDispose != null) {
      widget.onDispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
