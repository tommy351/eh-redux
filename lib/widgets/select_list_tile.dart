import 'package:flutter/material.dart';

class SelectListTile<T> extends StatefulWidget {
  final Widget title;
  final Function(T) onChanged;
  final List<DropdownMenuItem<T>> items;
  final T value;

  const SelectListTile({
    Key key,
    @required this.title,
    @required this.items,
    @required this.value,
    @required this.onChanged,
  })  : assert(title != null),
        assert(items != null),
        assert(value != null),
        super(key: key);

  @override
  _SelectListTileState<T> createState() => _SelectListTileState<T>();
}

class _SelectListTileState<T> extends State<SelectListTile<T>> {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex();
  }

  @override
  void didUpdateWidget(SelectListTile<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedIndex();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.title,
      subtitle:
          _selectedIndex != null ? widget.items[_selectedIndex]?.child : null,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: widget.title,
              children: widget.items.map((e) {
                return RadioListTile<T>(
                  key: e.key,
                  groupValue: _selectedIndex != null
                      ? widget.items[_selectedIndex].value
                      : null,
                  value: e.value,
                  title: e.child,
                  onChanged: (value) {
                    if (e.onTap != null) {
                      e.onTap();
                    }

                    widget.onChanged(value);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            );
          },
        );
      },
    );
  }

  void _updateSelectedIndex() {
    assert(widget.value == null ||
        widget.items.where((element) => element.value == widget.value).length ==
            1);

    _selectedIndex = null;

    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items[i].value == widget.value) {
        _selectedIndex = i;
        return;
      }
    }
  }
}
