import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'category_label.g.dart';

@swidget
Widget categoryLabel(
  BuildContext context, {
  @required String category,
}) {
  final labels = <String, String>{
    'Doujinshi': AppLocalizations.of(context).categoryDoujinshi,
    'Manga': AppLocalizations.of(context).categoryManga,
    'Artist CG': AppLocalizations.of(context).categoryArtistCG,
    'Game CG': AppLocalizations.of(context).categoryGameCG,
    'Western': AppLocalizations.of(context).categoryWestern,
    'Non-H': AppLocalizations.of(context).categoryNonH,
    'Image Set': AppLocalizations.of(context).categoryImageSet,
    'Cosplay': AppLocalizations.of(context).categoryCosplay,
    'Asian Porn': AppLocalizations.of(context).categoryAsianPorn,
    'Misc': AppLocalizations.of(context).categoryMisc,
  };

  return Text(labels[category] ?? category);
}
