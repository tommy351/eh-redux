// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_list_tile.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class SelectListTile<T> extends StatelessWidget {
  const SelectListTile(
      {Key? key,
      this.title,
      required this.items,
      required this.value,
      required this.onChanged})
      : super(key: key);

  final Widget? title;

  final List<DropdownMenuItem<T>> items;

  final T value;

  final dynamic Function(T) onChanged;

  @override
  Widget build(BuildContext _context) => selectListTile<T>(_context,
      title: title, items: items, value: value, onChanged: onChanged);
}
