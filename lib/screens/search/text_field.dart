import 'package:eh_redux/screens/search/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key key}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchStore = Provider.of<SearchStore>(context);

    return TextField(
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
      ),
      style: theme.textTheme.headline6,
      onChanged: (String value) {
        searchStore.setQuery(value);
      },
      onSubmitted: (String value) {
        searchStore.setQuery(value);
        searchStore.updatePaginationKey();
      },
    );
  }
}
