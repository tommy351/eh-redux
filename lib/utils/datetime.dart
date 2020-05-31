DateTime tryParseSecondsSinceEpoch(String s) {
  int n = int.tryParse(s);
  if (n == null) return null;

  return DateTime.fromMillisecondsSinceEpoch(n * 1000, isUtc: true);
}
