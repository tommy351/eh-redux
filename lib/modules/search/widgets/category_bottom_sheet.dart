import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/gallery/widgets/category_icon.dart';
import 'package:eh_redux/modules/gallery/widgets/category_label.dart';
import 'package:eh_redux/modules/search/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'category_bottom_sheet.g.dart';

@swidget
Widget categoryBottomSheet(
  BuildContext context, {
  @required SearchStore store,
}) {
  const categories = <String, int>{
    'Doujinshi': 1 << 1,
    'Manga': 1 << 2,
    'Artist CG': 1 << 3,
    'Game CG': 1 << 4,
    'Western': 1 << 9,
    'Non-H': 1 << 8,
    'Image Set': 1 << 5,
    'Cosplay': 1 << 6,
    'Asian Porn': 1 << 7,
    'Misc': 1 << 0,
  };

  return Provider.value(
    value: store,
    child: DraggableScrollableSheet(
      expand: false,
      initialChildSize: 1,
      builder: (context, controller) {
        return BottomSheetContainer(
          child: ListView.builder(
            controller: controller,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final entry = categories.entries.elementAt(index);

              return _CategoryTile(
                category: entry.key,
                value: entry.value,
              );
            },
          ),
        );
      },
    ),
  );
}

@swidget
Widget _categoryTile(
  BuildContext context, {
  @required String category,
  @required int value,
}) {
  final store = Provider.of<SearchStore>(context);

  return Observer(
    builder: (context) {
      return CheckboxListTile(
        title: Row(
          children: [
            IconTheme(
              data: const IconThemeData(size: 16),
              child: CategoryIcon(category: category),
            ),
            const SizedBox(width: 8),
            CategoryLabel(category: category),
          ],
        ),
        value: store.categoryFilter & value == 0,
        onChanged: (checked) {
          if (checked) {
            store.setCategoryFilter(store.categoryFilter - value);
          } else {
            store.setCategoryFilter(store.categoryFilter + value);
          }
        },
      );
    },
  );
}
