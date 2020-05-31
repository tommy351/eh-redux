import 'dart:collection';

HashMap<String, String> parseRules(String style) {
  final rules = new HashMap<String, String>();

  for (final rule in style.split(';')) {
    final index = rule.indexOf(':');
    rules[rule.substring(0, index).trim()] = rule.substring(index + 1).trim();
  }

  return rules;
}
