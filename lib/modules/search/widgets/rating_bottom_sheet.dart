import 'dart:math';

import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/search/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'rating_bottom_sheet.g.dart';

@swidget
Widget ratingBottomSheet(
  BuildContext context, {
  @required SearchStore store,
}) {
  return Provider.value(
    value: store,
    child: const BottomSheetContainer(
      child: _Body(),
    ),
  );
}

@swidget
Widget _body(BuildContext context) {
  final store = Provider.of<SearchStore>(context);

  return Observer(
    builder: (context) {
      final label = store.minimumRating > 0
          ? S.of(context).searchMinimumRatingLabel(store.minimumRating)
          : S.of(context).searchMinimumRatingDisabled;

      return Wrap(
        children: [
          ListTile(
            title: Text(S.of(context).searchMinimumRatingTitle),
            trailing: store.minimumRating > 0 ? Text(label) : null,
          ),
          Slider(
            value: max(store.minimumRating.toDouble(), 1),
            min: 1,
            max: 5,
            divisions: 4,
            label: label,
            onChanged: (value) {
              if (value < 2) {
                store.setMinimumRating(0);
              } else {
                store.setMinimumRating(value.floor());
              }
            },
          ),
        ],
      );
    },
  );
}
