import 'dart:typed_data';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english/common/helpers/bytes_to_file.dart';

Future<String> detectTextFromImage(Uint8List bytes) async {
  final file = await bytesToFile(bytes);
  XFile image = XFile(file.path);
  final InputImage inputImage = InputImage.fromFilePath(image.path);
  final textDetector = GoogleMlKit.vision.textRecognizer();
  final RecognizedText recognizedText =
      await textDetector.processImage(inputImage);
  return recognizedText.text;
}
