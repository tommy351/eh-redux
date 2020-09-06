import 'package:eh_redux/modules/image/store.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AnimatedNavigation extends StatefulWidget {
  const AnimatedNavigation({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _AnimatedNavigationState createState() => _AnimatedNavigationState();
}

class _AnimatedNavigationState extends State<AnimatedNavigation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  ReactionDisposer _dispose;

  @override
  void initState() {
    super.initState();

    final store = Provider.of<ImageStore>(context, listen: false);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _dispose = reaction<bool>((_) => store.navVisible, (visible) {
      if (visible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
