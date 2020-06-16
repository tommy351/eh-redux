import 'package:flutter/material.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    Key key,
    this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: value,
      ),
    );
  }
}
