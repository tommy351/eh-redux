import 'package:flutter/material.dart';

class ControllerTextField extends StatefulWidget {
  const ControllerTextField({
    Key key,
    this.value,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforced = true,
  }) : super(key: key);

  final String value;
  final void Function(String) onChanged;
  final InputDecoration decoration;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final int maxLines;
  final int minLines;
  final int maxLength;
  final bool maxLengthEnforced;

  @override
  _ControllerTextFieldState createState() => _ControllerTextFieldState();
}

class _ControllerTextFieldState extends State<ControllerTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ControllerTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: widget.decoration,
      autocorrect: widget.autofocus,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      maxLengthEnforced: widget.maxLengthEnforced,
    );
  }
}
