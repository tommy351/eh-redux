import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' show Color, Colors;

part 'favorite.g.dart';

const favoriteColors = <Color>[
  Colors.grey,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.lightGreen,
  Colors.lightBlue,
  Colors.blue,
  Colors.purple,
  Colors.pink,
];

abstract class FavoriteStatus
    implements Built<FavoriteStatus, FavoriteStatusBuilder> {
  factory FavoriteStatus([void Function(FavoriteStatusBuilder) updates]) =
      _$FavoriteStatus;
  FavoriteStatus._();

  static Serializer<FavoriteStatus> get serializer =>
      _$favoriteStatusSerializer;

  int get favorite;
  String get note;
}
