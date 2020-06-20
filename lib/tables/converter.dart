import 'dart:convert';

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
    return jsonDecode(fromDb) as List<T>;
  }
}
