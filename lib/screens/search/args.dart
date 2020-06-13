import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'args.g.dart';

abstract class SearchScreenArguments
    implements Built<SearchScreenArguments, SearchScreenArgumentsBuilder> {
  static Serializer<SearchScreenArguments> get serializer =>
      _$searchScreenArgumentsSerializer;

  String get query;

  factory SearchScreenArguments(
          [Function(SearchScreenArgumentsBuilder) updates]) =
      _$SearchScreenArguments;
  SearchScreenArguments._();
}

abstract class SearchScreenArgumentsBuilder
    implements Builder<SearchScreenArguments, SearchScreenArgumentsBuilder> {
  String query = '';

  factory SearchScreenArgumentsBuilder() = _$SearchScreenArgumentsBuilder;
  SearchScreenArgumentsBuilder._();
}
