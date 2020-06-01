String trimPrefix(String s, String prefix) {
  if (s.startsWith(prefix)) {
    return s.substring(prefix.length);
  }

  return s;
}

String trimSuffix(String s, String suffix) {
  if (s.endsWith(suffix)) {
    return s.substring(0, s.length - suffix.length);
  }

  return s;
}
