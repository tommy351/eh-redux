// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _body(_context);
}

class _Title extends StatelessWidget {
  const _Title(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext _context) => _title(_context, title);
}

class _SelectTile<T> extends StatelessWidget {
  const _SelectTile(
      {Key? key,
      required this.title,
      required this.preference,
      required this.items})
      : super(key: key);

  final String title;

  final Preference<T> preference;

  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext _context) => _selectTile<T>(_context,
      title: title, preference: preference, items: items);
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({Key? key, required this.title, required this.preference})
      : super(key: key);

  final String title;

  final Preference<bool> preference;

  @override
  Widget build(BuildContext _context) =>
      _switchTile(_context, title: title, preference: preference);
}
