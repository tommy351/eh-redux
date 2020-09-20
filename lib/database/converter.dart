import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:moor/moor.dart';

class ListConverter<T> extends TypeConverter<List<T>, String> {
  @override
  String mapToSql(List<T> value) {
    if (value == null) return null;
    return jsonEncode(value);
  }

  @override
  List<T> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    return (jsonDecode(fromDb) as List).map((e) => e as T).toList();
  }
}

class EnumStringConverter<T> extends TypeConverter<T, String> {
  const EnumStringConverter(this.values);

  final List<T> values;

  @override
  String mapToSql(T value) {
    if (value == null) return null;
    return EnumToString.parse(value);
  }

  @override
  T mapToDart(String fromDb) {
    if (fromDb == null) return null;
    return EnumToString.fromString(values, fromDb);
  }
}
