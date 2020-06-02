import 'package:flutter/material.dart';

class CenterProgressIndicator extends StatelessWidget {
  final double value;

  const CenterProgressIndicator({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: value,
      ),
    );
  }
}
