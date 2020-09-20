// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_bottom_sheet.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key key, @required this.store}) : super(key: key);

  final SearchStore store;

  @override
  Widget build(BuildContext _context) =>
      filterBottomSheet(_context, store: store);
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({Key key, @required this.name, @required this.label})
      : super(key: key);

  final String name;

  final String label;

  @override
  Widget build(BuildContext _context) =>
      _optionTile(_context, name: name, label: label);
}
