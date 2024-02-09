import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<File> bytesToFile(Uint8List bytes) async {
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  File file = await File('$path/temp${DateTime.now()}.png').create();
  file.writeAsBytesSync(bytes);
  return file;
}
