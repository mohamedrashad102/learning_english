// import 'dart:async';
// import 'dart:typed_data';

// import 'package:image/image.dart';
// import 'package:tflite/tflite.dart';

// const int imgSize = 28;

// class MnistClassifier {
//   // Model files
//   static const String modelFilename = "assets/model/mnist.tflite";
//   static const String modelLabels = "assets/model/labels.txt";

//   // Model inputs
//   static const int imgWidth = 28;
//   static const int imgHeight = 28;
//   static const int floatSize = 4;
//   static const int pixelSize = 4;
//   static const int modelInputSize =
//       floatSize * imgWidth * imgHeight * pixelSize;

//   // Model outputs
//   static const int numClassificationResults = 3;
// }

// class MnistClassifierResult {
//   final String fileName;
//   final String label;
//   final int index;
//   final double confidence;

//   MnistClassifierResult({
//     required this.fileName,
//     required this.label,
//     required this.index,
//     required this.confidence,
//   });
// }

// Uint8List imageToByteListFloat32(Image image, int width, int height) {
//   var convertedBytes = Float32List(width * height);
//   var buffer = Float32List.view(convertedBytes.buffer);
//   int pixelIndex = 0;
//   for (var i = 0; i < width; i++) {
//     for (var j = 0; j < height; j++) {
//       var pixel = image.getPixel(j, i);
//       buffer[pixelIndex++] =
//           (getRed(pixel) + getGreen(pixel) + getBlue(pixel)) / 3 / 255.0;
//     }
//   }
//   return convertedBytes.buffer.asUint8List();
// }

// Future<MnistClassifierResult> classifyImage(String imgFile) async {
//   await Tflite.loadModel(
//     model: MnistClassifier.modelFilename,
//     labels: MnistClassifier.modelLabels,
//   );

//   await Tflite.runModelOnImage(path: imgFile);
//   await Tflite.close();
// }
