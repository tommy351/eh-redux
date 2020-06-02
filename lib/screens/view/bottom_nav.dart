import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/view/store.dart';
import 'package:ehreader/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ViewBottomNavigation extends StatefulWidget {
  const ViewBottomNavigation({Key key}) : super(key: key);

  @override
  _ViewBottomNavigationState createState() => _ViewBottomNavigationState();
}

class _ViewBottomNavigationState extends State<ViewBottomNavigation> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    final viewStore = Provider.of<ViewStore>(context);
    final gallery = Provider.of<Gallery>(context);

    return StatefulWrapper(
      onInit: (context) {
        return reaction((_) => viewStore.currentPage, (int page) {
          setState(() {
            _value = page.toDouble();
          });
        });
      },
      builder: (context) {
        return Container(
          height: 60,
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
        );
      },
    );
  }
}
