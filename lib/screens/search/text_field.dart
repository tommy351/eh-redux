import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key key}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchStore = Provider.of<SearchStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        if (searchStore.query.isNotEmpty) {
          _controller.text = searchStore.query;
        } else {
          _focusNode.requestFocus();
        }

        return () {};
      },
      builder: (context) {
        return TextField(
          controller: _controller,
          focusNode: _focusNode,
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
      },
    );
  }
}
