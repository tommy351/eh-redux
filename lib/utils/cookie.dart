import 'dart:collection';

Map<String, String> parseCookies(String cookies) {
  final result = HashMap<String, String>();

  for (final cookie in cookies.split(';')) {
    final index = cookie.indexOf('=');

    if (index > -1) {
      final key = cookie.substring(0, index).trim();
      final value = cookie.substring(index + 1).trim();
      result[key] = value;
    }
  }

  return result;
}
