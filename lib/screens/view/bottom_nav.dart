import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'store.dart';

class ViewBottomNavigation extends StatefulWidget {
  const ViewBottomNavigation({
    Key key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  _ViewBottomNavigationState createState() => _ViewBottomNavigationState();
}

class _ViewBottomNavigationState extends State<ViewBottomNavigation>
    with TickerProviderStateMixin {
  static const _height = 60.0;
  AnimationController _animationController;
  double _value = 0;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewStore = Provider.of<ViewStore>(context);
    final gallery = Provider.of<Gallery>(context);

    return StatefulWrapper(
      onInit: (context) {
        final disposes = <Function>[
          autorun((_) {
            final currentPage = viewStore.currentPage;

            setState(() {
              _value = currentPage.toDouble();
            });
          }),
          reaction((_) => viewStore.navVisible, (bool visible) {
            if (visible) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          }),
        ];

        return () {
          for (final dispose in disposes) {
            dispose();
          }
        };
      },
      builder: (context) {
        return FadeTransition(
          opacity: _animation,
          child: Container(
            color: Colors.black.withOpacity(0.4),
            padding: widget.padding,
            child: Container(
              height: _height,
              child: SliderTheme(
                data: SliderTheme.of(context),
                child: Slider(
                  max: gallery.fileCount.toDouble() - 1,
                  value: _value,
                  divisions: gallery.fileCount,
                  label: '${_value.toInt() + 1}',
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  onChangeEnd: (double value) {
                    viewStore.setPage(value.toInt());
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
