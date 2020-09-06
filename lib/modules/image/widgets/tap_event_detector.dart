import 'package:eh_redux/modules/image/store.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'tap_event_detector.g.dart';

@swidget
Widget tapEventDetector(
  BuildContext context, {
  @required void Function() onPrevious,
  @required void Function() onNext,
  @required Widget child,
}) {
  final width = MediaQuery.of(context).size.width;
  final store = Provider.of<ImageStore>(context);

  return GestureDetector(
    onTapUp: (details) {
      final dx = details.localPosition.dx;

      if (dx < width / 3) {
        onPrevious();
      } else if (dx > width / 3 * 2) {
        onNext();
      } else {
        store.toggleNav();
      }
    },
    child: child,
  );
}
