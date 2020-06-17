import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/category_colors.dart';
import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({
    Key key,
    @required this.category,
    this.labelBuilder,
    this.indicatorSize = 0,
    this.indicatorPadding = const EdgeInsets.only(right: 8),
    this.indicatorShape = BoxShape.circle,
  })  : assert(category != null),
        assert(indicatorSize >= 0),
        super(key: key);

  final String category;
  final String Function(String) labelBuilder;
  final double indicatorSize;
  final EdgeInsets indicatorPadding;
  final BoxShape indicatorShape;

  @override
  Widget build(BuildContext context) {
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

    final localizedLabel = labels[category] ?? category;
    final label =
        labelBuilder == null ? localizedLabel : labelBuilder(localizedLabel);

    if (indicatorSize > 0) {
      return Row(
        children: <Widget>[
          Padding(
            padding: indicatorPadding,
            child: Container(
              width: indicatorSize,
              height: indicatorSize,
              decoration: BoxDecoration(
                shape: indicatorShape,
                color: categoryColors[category] ?? categoryColors[''],
              ),
            ),
          ),
          Text(label),
        ],
      );
    }

    return Text(label);
  }
}
