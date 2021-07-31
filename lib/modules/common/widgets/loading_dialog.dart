import 'package:flutter/material.dart';

class LoadingDialog<T> extends StatefulWidget {
  const LoadingDialog({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future<T> future;

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  void initState() {
    super.initState();
    widget.future.then((value) => Navigator.pop(context, value));
  }

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

Future<T?> showLoadingDialog<T>({
  required BuildContext context,
  required Future<T> future,
}) async {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return LoadingDialog(
        future: future,
      );
    },
  );
}
