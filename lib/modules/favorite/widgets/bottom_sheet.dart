import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/common/widgets/full_width.dart';
import 'package:eh_redux/modules/common/widgets/loading_dialog.dart';
import 'package:eh_redux/modules/favorite/store.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'icon.dart';

part 'bottom_sheet.g.dart';

class FavoriteBottomSheet extends StatefulWidget {
  const FavoriteBottomSheet({
    Key? key,
    required this.gallery,
  }) : super(key: key);

  final Gallery gallery;

  @override
  _FavoriteBottomSheetState createState() => _FavoriteBottomSheetState();
}

class _FavoriteBottomSheetState extends State<FavoriteBottomSheet> {
  late FavoriteStore _store;

  @override
  void initState() {
    super.initState();
    _store = FavoriteStore(
      client: Provider.of<EHentaiClient>(context, listen: false),
      gallery: widget.gallery,
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _store,
      child: const BottomSheetContainer(
        child: _Content(),
      ),
    );
  }
}

@swidget
Widget _content(BuildContext context) {
  final store = Provider.of<FavoriteStore>(context);

  return Padding(
    padding: const EdgeInsets.all(16),
    child: Observer(
      builder: (context) {
        if (!store.loaded) {
          return Wrap(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        }

        return Wrap(
          runSpacing: 8,
          children: [
            const _FavoriteSelect(),
            const _NoteField(),
            Wrap(
              children: const [
                _AddButton(),
                _DeleteButton(),
              ],
            ),
          ],
        );
      },
    ),
  );
}

@swidget
Widget _loadingPlaceholder(BuildContext context) {
  return Wrap(
    children: const [
      Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ],
  );
}

@swidget
Widget _favoriteSelect(BuildContext context) {
  final store = Provider.of<FavoriteStore>(context);

  return Observer(
    builder: (context) {
      final nameKeys = store.names.keys.toList();

      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: AppLocalizations.of(context)!.favoriteFavoritesPlaceholder,
          labelText: AppLocalizations.of(context)!.favoriteFavoritesPlaceholder,
        ),
        isExpanded: true,
        value: store.index,
        onChanged: (value) {
          if (value != null) store.setIndex(value);
        },
        items: store.names.entries
            .map((e) => DropdownMenuItem<String>(
                  value: e.key,
                  child: Row(children: [
                    IconTheme(
                      data: const IconThemeData(size: 16),
                      child: FavoriteIcon(favorite: nameKeys.indexOf(e.key)),
                    ),
                    const SizedBox(width: 8),
                    Text(e.value),
                  ]),
                ))
            .toList(),
      );
    },
  );
}

@swidget
Widget _noteField(BuildContext context) {
  final store = Provider.of<FavoriteStore>(context);

  return TextField(
    maxLines: null,
    maxLength: 200,
    controller: store.note,
    decoration: InputDecoration(
      hintText: AppLocalizations.of(context)!.favoriteNotePlaceholder,
      labelText: AppLocalizations.of(context)!.favoriteNotePlaceholder,
      border: const OutlineInputBorder(),
    ),
  );
}

@swidget
Widget _addButton(BuildContext context) {
  final store = Provider.of<FavoriteStore>(context);

  return FullWidth(
    child: ElevatedButton.icon(
      onPressed: () async {
        await showLoadingDialog(
          context: context,
          future: store.addToFavorites(),
        );
        Navigator.pop(context);
      },
      icon: const Icon(Icons.favorite),
      label: Text(AppLocalizations.of(context)!.favoriteAddButtonLabel),
    ),
  );
}

@swidget
Widget _deleteButton(BuildContext context) {
  final theme = Theme.of(context);
  final store = Provider.of<FavoriteStore>(context);

  return Observer(
    builder: (context) {
      if (!store.canDelete) return Container();

      return FullWidth(
        child: TextButton.icon(
          onPressed: () async {
            final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return _DeleteConfirm(store: store);
                  },
                ) ??
                false;

            if (confirmed) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.delete),
          label: Text(AppLocalizations.of(context)!.favoriteDeleteButtonLabel),
          style: TextButton.styleFrom(
            primary: theme.errorColor,
          ),
        ),
      );
    },
  );
}

@swidget
Widget _deleteConfirm(
  BuildContext context, {
  required FavoriteStore store,
}) {
  return AlertDialog(
    title: Text(AppLocalizations.of(context)!.favoriteDeleteDialogTitle),
    content: Text(AppLocalizations.of(context)!.favoriteDeleteDialogContent),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context, false);
        },
        child: Text(AppLocalizations.of(context)!.cancelButtonLabel),
      ),
      TextButton(
        onPressed: () async {
          await showLoadingDialog(
            context: context,
            future: store.deleteFromFavorites(),
          );
          Navigator.pop(context, true);
        },
        child: Text(AppLocalizations.of(context)!.removeButtonLabel),
      ),
    ],
  );
}
