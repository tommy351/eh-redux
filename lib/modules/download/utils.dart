import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<Directory> getGalleryDownloadDirectory(int galleryId) async {
  final docDir = await getApplicationDocumentsDirectory();
  return Directory(p.join(docDir.path, 'downloads', galleryId.toString()));
}
