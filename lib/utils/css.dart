import 'dart:collection';

Map<String, String> parseRules(String style) {
  final rules = HashMap<String, String>();

  for (final rule in style.split(';')) {
    final index = rule.indexOf(':');

    if (index > -1) {
      rules[rule.substring(0, index).trim()] = rule.substring(index + 1).trim();
    }
  }

  return rules;
}
