import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/common/widgets/full_width.dart';
import 'package:eh_redux/modules/common/widgets/loading_dialog.dart';
import 'package:eh_redux/modules/download/controller.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'confirm_bottom_sheet.g.dart';

Future<void> showDownloadConfirmBottomSheet({
  @required BuildContext context,
  @required Gallery gallery,
}) async {
  final result = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DownloadConfirmBottomSheet(gallery: gallery);
    },
  );

  if (result is bool && result) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(AppLocalizations.of(context).downloadStartedHint),
    ));
  }
}

@swidget
Widget downloadConfirmBottomSheet(
  BuildContext context, {
  @required Gallery gallery,
}) {
  final theme = Theme.of(context);
  final controller = Provider.of<DownloadController>(context);

  return BottomSheetContainer(
    child: Wrap(
      runSpacing: 8,
      children: [
        ListTile(
          title: Text(
            AppLocalizations.of(context).downloadConfirmTitle(
              gallery.fileCount,
              filesize(gallery.fileSize),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: FullWidth(
            child: RaisedButton.icon(
              onPressed: () async {
                await showLoadingDialog(
                  context: context,
                  future: controller.create(gallery),
                );
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.file_download),
              label: Text(AppLocalizations.of(context).downloadButtonLabel),
              color: theme.accentColor,
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
