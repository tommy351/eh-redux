import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'store.dart';

class ViewBottomNavigation extends StatefulWidget {
  final EdgeInsets padding;

  const ViewBottomNavigation({
    Key key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  _ViewBottomNavigationState createState() => _ViewBottomNavigationState();
}

class _ViewBottomNavigationState extends State<ViewBottomNavigation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0,
    );
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
          reaction((_) => viewStore.currentPage, (int page) {
            setState(() {
              _value = page.toDouble();
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
        final height = 60.0 + widget.padding.top + widget.padding.bottom;

        final position = Tween<Offset>(
          begin: Offset(0, height),
          end: const Offset(0, 0),
        ).animate(_animationController);

        return SlideTransition(
          position: position,
          child: Container(
            height: height,
            padding: widget.padding,
            color: Colors.black.withOpacity(0.5),
            child: SliderTheme(
              data: SliderTheme.of(context),
              child: Slider(
                min: 0,
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
        );
      },
    );
  }
}
