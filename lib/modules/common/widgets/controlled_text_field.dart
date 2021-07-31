import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControllerTextField extends StatefulWidget {
  const ControllerTextField({
    Key? key,
    required this.value,
    required this.onChanged,
    this.decoration = const InputDecoration(),
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.maxLines = 1,
    required this.minLines,
    required this.maxLength,
    this.maxLengthEnforcement = MaxLengthEnforcement.enforced,
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
  final MaxLengthEnforcement maxLengthEnforcement;

  @override
  _ControllerTextFieldState createState() => _ControllerTextFieldState();
}

class _ControllerTextFieldState extends State<ControllerTextField> {
  late TextEditingController _controller;

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
      maxLengthEnforcement: widget.maxLengthEnforcement,
    );
  }
}
