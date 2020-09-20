import 'package:eh_redux/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'category_label.g.dart';

@swidget
Widget categoryLabel(
  BuildContext context, {
  @required String category,
}) {
  final labels = <String, String>{
    'Doujinshi': S.of(context).categoryDoujinshi,
    'Manga': S.of(context).categoryManga,
    'Artist CG': S.of(context).categoryArtistCG,
    'Game CG': S.of(context).categoryGameCG,
    'Western': S.of(context).categoryWestern,
    'Non-H': S.of(context).categoryNonH,
    'Image Set': S.of(context).categoryImageSet,
    'Cosplay': S.of(context).categoryCosplay,
    'Asian Porn': S.of(context).categoryAsianPorn,
    'Misc': S.of(context).categoryMisc,
  };

  return Text(labels[category] ?? category);
}
