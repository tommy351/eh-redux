import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class EnumAdapter<T> extends PreferenceAdapter<T> {
  const EnumAdapter(this.enumValues);

  final List<T> enumValues;

  @override
  T? getValue(SharedPreferences preferences, String key) {
    final value = preferences.getString(key);
    if (value == null) return null;
    return EnumToString.fromString(enumValues, value);
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, T value) {
    return preferences.setString(key, EnumToString.convertToString(value));
  }
}
