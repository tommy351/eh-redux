import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/gallery/widgets/list.dart';
import 'package:eh_redux/modules/home/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'tab.g.dart';

@swidget
Widget historyTab(BuildContext context) {
  final database = Provider.of<Database>(context);

  return StreamProvider<List<Gallery>>(
    initialData: const [],
    create: (_) => database.historyDao.watchAll(),
    child: NestedScrollView(
      headerSliverBuilder: (context, _) => const [_AppBar()],
      body: const _Content(),
    ),
  );
}

@swidget
Widget _appBar(BuildContext context) {
  return SliverAppBar(
    title: Text(AppLocalizations.of(context)!.homeTabTitleHistory),
    pinned: true,
  );
}

@swidget
Widget _content(BuildContext context) {
  final data = Provider.of<List<Gallery>>(context);

  return HomeBody(
    child: GalleryList(data: data),
  );
}
