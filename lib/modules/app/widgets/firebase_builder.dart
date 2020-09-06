import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FirebaseBuilder extends StatefulWidget {
  const FirebaseBuilder({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _FirebaseBuilderState createState() => _FirebaseBuilderState();
}

class _FirebaseBuilderState extends State<FirebaseBuilder> {
  Future<void> _initFirebaseFuture;

  @override
  void initState() {
    super.initState();
    _initFirebaseFuture = initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFirebaseFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return widget.child;
        }

        return Container();
      },
    );
  }
}
