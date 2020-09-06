import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/common/widgets/full_width.dart';
import 'package:eh_redux/modules/favorite/store.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/gallery/widgets/screen.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'icon.dart';

part 'bottom_sheet.g.dart';

class FavoriteBottomSheet extends StatefulWidget {
  const FavoriteBottomSheet({
    Key key,
    @required this.gallery,
  })  : assert(gallery != null),
        super(key: key);

  final Gallery gallery;

  @override
  _FavoriteBottomSheetState createState() => _FavoriteBottomSheetState();
}

class _FavoriteBottomSheetState extends State<FavoriteBottomSheet> {
  FavoriteStore _store;

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
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        isExpanded: true,
        value: store.index,
        onChanged: store.setIndex,
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
      hintText: S.of(context).favoriteNotePlaceholder,
      border: const OutlineInputBorder(),
    ),
  );
}

@swidget
Widget _addButton(BuildContext context) {
  final theme = Theme.of(context);
  final store = Provider.of<FavoriteStore>(context);

  return FullWidth(
    child: RaisedButton.icon(
      onPressed: () async {
        await store.addToFavorites();
        Navigator.pop(context);
      },
      icon: const Icon(Icons.favorite),
      label: Text(S.of(context).favoriteAddButtonLabel),
      color: theme.accentColor,
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
        child: FlatButton.icon(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return _DeleteConfirm(store: store);
              },
            );
          },
          icon: const Icon(Icons.delete),
          label: Text(S.of(context).favoriteDeleteButtonLabel),
          textColor: theme.errorColor,
        ),
      );
    },
  );
}

@swidget
Widget _deleteConfirm(
  BuildContext context, {
  @required FavoriteStore store,
}) {
  return AlertDialog(
    title: Text(S.of(context).favoriteDeleteDialogTitle),
    content: Text(S.of(context).favoriteDeleteDialogContent),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(S.of(context).cancelButtonLabel),
      ),
      FlatButton(
        onPressed: () async {
          await store.deleteFromFavorites();
          Navigator.popUntil(context, ModalRoute.withName(GalleryScreen.route));
        },
        child: Text(S.of(context).removeButtonLabel),
      ),
    ],
  );
}
