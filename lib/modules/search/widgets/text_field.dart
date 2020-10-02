import 'package:eh_redux/database/database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/search/store.dart';
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

  @override
  void initState() {
    super.initState();
    final searchStore = Provider.of<SearchStore>(context, listen: false);
    _controller = TextEditingController(text: searchStore.query);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final store = Provider.of<SearchStore>(context);

    return TypeAheadField<SearchHistoryEntry>(
      hideOnEmpty: true,
      hideOnError: true,
      hideOnLoading: true,
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: _controller.text.isEmpty,
        controller: _controller,
        onSubmitted: (value) {
          store.setQuery(value as String);
        },
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).searchTextFieldHint,
          border: InputBorder.none,
        ),
        style: theme.textTheme.headline6,
        textInputAction: TextInputAction.search,
      ),
      transitionBuilder: (context, suggestionsBox, animationController) {
        return suggestionsBox;
      },
      onSuggestionSelected: (value) {
        _controller.text = value.query;
        store.setQuery(value.query);
      },
      suggestionsCallback: (pattern) async {
        return store.searchHistoriesDao.listEntries(pattern);
      },
      itemBuilder: (context, value) {
        return ListTile(
          leading: const Icon(Icons.history),
          title: Text(value.query),
        );
      },
    );
  }
}
