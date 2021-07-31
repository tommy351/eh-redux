import 'package:eh_redux/modules/image/store.dart';
import 'package:eh_redux/modules/image/widgets/animated_navigation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ImageBottomNav extends StatefulWidget {
  const ImageBottomNav({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  _ImageBottomNavState createState() => _ImageBottomNavState();
}

class _ImageBottomNavState extends State<ImageBottomNav> {
  double _value = 0;
  late ReactionDisposer _dispose;

  @override
  void initState() {
    super.initState();

    final store = Provider.of<ImageStore>(context, listen: false);
    _dispose = autorun((_) {
      final currentPage = store.currentPage;

      setState(() {
        _value = currentPage.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ImageStore>(context);

    return AnimatedNavigation(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        padding: widget.padding,
        child: SizedBox(
          height: 60,
          child: SliderTheme(
            data: SliderTheme.of(context),
            child: Slider(
              max: store.totalPage.toDouble() - 1,
              value: _value,
              divisions: store.totalPage,
              label: '${_value.toInt() + 1}',
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
              onChangeEnd: (double value) {
                store.setCurrentPage(value.toInt());
              },
            ),
          ),
        ),
      ),
    );
  }
}
