import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'select_list_tile.g.dart';

@swidget
Widget selectListTile<T>(
  BuildContext context, {
  Widget? title,
  required List<DropdownMenuItem<T>> items,
  required T value,
  required Function(T) onChanged,
}) {
  final index = items.indexWhere((e) => e.value == value);

  return ListTile(
    title: title,
    subtitle: items[index].child,
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: title,
            children: items
                .map((e) => RadioListTile<T?>(
                      key: e.key,
                      value: e.value,
                      groupValue: items[index].value,
                      title: e.child,
                      onChanged: (value) {
                        e.onTap?.call();
                        if (value != null) onChanged(value);
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          );
        },
      );
    },
  );
}
