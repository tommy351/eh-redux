import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/search/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'filter_bottom_sheet.g.dart';

@swidget
Widget filterBottomSheet(
  BuildContext context, {
  @required SearchStore store,
}) {
  final options = <String, String>{
    'f_sname': S.of(context).searchFilterSearchGalleryName,
    'f_stags': S.of(context).searchFilterSearchGalleryTags,
    'f_sdesc': S.of(context).searchFilterSearchGalleryDescription,
    'f_storr': S.of(context).searchFilterSearchTorrentFilenames,
    'f_sto': S.of(context).searchFilterOnlyShowGalleriesWithTorrents,
    'f_sdt1': S.of(context).searchFilterSearchLowPowerTags,
    'f_sdt2': S.of(context).searchFilterSearchDownvotedTags,
    'f_sh': S.of(context).searchFilterShowExpungedGalleries,
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
            itemCount: options.length,
            itemBuilder: (context, index) {
              final entry = options.entries.elementAt(index);

              return _OptionTile(
                name: entry.key,
                label: entry.value,
              );
            },
          ),
        );
      },
    ),
  );
}

@swidget
Widget _optionTile(
  BuildContext context, {
  @required String name,
  @required String label,
}) {
  final store = Provider.of<SearchStore>(context);

  return Observer(
    builder: (context) {
      return SwitchListTile.adaptive(
        title: Text(label),
        value: store.advancedOptions[name] ?? false,
        onChanged: (checked) {
          store.setAdvancedOption(key: name, value: checked);
        },
      );
    },
  );
}
