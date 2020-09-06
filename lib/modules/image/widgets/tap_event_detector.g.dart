// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tap_event_detector.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class TapEventDetector extends StatelessWidget {
  const TapEventDetector(
      {Key key,
      @required this.onPrevious,
      @required this.onNext,
      @required this.child})
      : super(key: key);

  final void Function() onPrevious;

  final void Function() onNext;

  final Widget child;

  @override
  Widget build(BuildContext _context) => tapEventDetector(_context,
      onPrevious: onPrevious, onNext: onNext, child: child);
}
