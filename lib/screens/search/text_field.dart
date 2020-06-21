import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
        return TypeAheadField<SearchHistoryEntry>(
          hideOnEmpty: true,
          hideOnError: true,
          hideOnLoading: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (value) {
              searchStore.setQuery(value as String);
            },
            onSubmitted: (value) {
              searchStore.setQuery(value as String);
              searchStore.updatePaginationKey();
            },
            decoration: InputDecoration(
              hintText: S.of(context).search,
              border: InputBorder.none,
            ),
            style: theme.textTheme.headline6,
          ),
          transitionBuilder: (context, suggestionsBox, animationController) {
            return suggestionsBox;
          },
          onSuggestionSelected: (value) {
            _controller.text = value.query;
            searchStore.setQuery(value.query);
            searchStore.updatePaginationKey();
          },
          suggestionsCallback: (pattern) async {
            return searchStore.searchHistoriesDao.listEntries(pattern);
          },
          itemBuilder: (context, value) {
            return ListTile(
              leading: const Icon(Icons.history),
              title: Text(value.query),
            );
          },
        );
      },
    );
  }
}
