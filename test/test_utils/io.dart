import 'dart:io';

import 'package:path/path.dart';

// https://stackoverflow.com/a/59411310
Future<File> getProjectFile(String path) async {
  var dir = Directory.current;
  while (
      !await dir.list().any((entity) => entity.path.endsWith('pubspec.yaml'))) {
    dir = dir.parent;
  }

  return File(join(dir.path, normalize(path)));
}

Future<String> readProjectFileAsString(String path) async {
  final file = await getProjectFile(path);
  return file.readAsString();
}
