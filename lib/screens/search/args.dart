import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'args.g.dart';

abstract class SearchScreenArguments
    implements Built<SearchScreenArguments, SearchScreenArgumentsBuilder> {
  factory SearchScreenArguments(
          [Function(SearchScreenArgumentsBuilder) updates]) =
      _$SearchScreenArguments;
  SearchScreenArguments._();

  static Serializer<SearchScreenArguments> get serializer =>
      _$searchScreenArgumentsSerializer;

  String get query;
}

abstract class SearchScreenArgumentsBuilder
    implements Builder<SearchScreenArguments, SearchScreenArgumentsBuilder> {
  factory SearchScreenArgumentsBuilder() = _$SearchScreenArgumentsBuilder;
  SearchScreenArgumentsBuilder._();

  String query = '';
}
