import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:learning_english/common/helpers/detect_text_from_image.dart';
import 'package:learning_english/common/services/audio_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'widgets/draw_letter_text.dart';
import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/my_painter.dart';

class LettersTestView extends StatefulWidget {
  const LettersTestView({super.key});
  static const id = 'LettersTestView';

  @override
  State<LettersTestView> createState() => _LettersTestViewState();
}

class _LettersTestViewState extends State<LettersTestView> {
  String selectText = '';
  final List<List<Offset>> points = [[]];
  bool isSuccess = false;
  bool isLoading = false;
  bool isNiceTry = false;
  // FlutterGifController flutterGifController = FlutterGifController(vsync: this);
  WidgetsToImageController widgetController = WidgetsToImageController();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String letter = arguments['letter'];
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DrawLetterText(letter: letter),
                    const Gap(5),
                    WidgetsToImage(
                      controller: widgetController,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onPanDown: (details) {
                                _addPoint(
                                    details.localPosition); // takes offset
                              },
                              onPanUpdate: (details) {
                                _addPoint(
                                    details.localPosition); // takes offset
                              },
                              onPanEnd: (details) {
                                _endDrawing();
                              },
                              child: Visibility(
                                visible: !isNiceTry,
                                child: Container(
                                  color: Colors.green,
                                  width: 250,
                                  height: 100,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !isNiceTry,
                              child: CustomPaint(
                                painter: MyPainter(points),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextButton(
                            text: 'تحقق',
                            bgColor: Colors.blue,
                            onPressed: () async => _checkTheAnswer(letter),
                          ),
                          CustomTextButton(
                            text: 'مسح',
                            bgColor: Colors.red,
                            onPressed: () => _clearPoints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isSuccess,
                  child: Image.asset(
                    'assets/data/celebration.gif',
                  ),
                ),
                Visibility(
                  visible: isNiceTry,
                  child: Image.asset(
                    'assets/data/nice_try.gif',
                  ),
                ),
                // Visibility(
                //   visible: niceTry,
                //   child: Image.asset(
                //     'assets/data/nice_try.gif',
                //   ),
                // ),
                // GifImage(
                //   image: const AssetImage('assets/data/celebration.gif'),
                //   controller: flutterGifController,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addPoint(Offset point) {
    setState(() {
      points.last.add(point);
    });
  }

  void _endDrawing() {
    points.add([]);
  }

  void _clearPoints() {
    setState(() {
      points.clear();
    });
  }

  _checkTheAnswer(String letter) async {
    setState(() {
      isLoading = true;
    });
    final bytes = await widgetController.capture();
    selectText = await detectTextFromImage(bytes!);
    String correct = letter.toUpperCase() + letter.toLowerCase();
    if (selectText.replaceAll(' ', '') == correct.replaceAll(' ', '')) {
      AudioService.playFromAssets('data/celebration.wav');
      isSuccess = true;
      setState(() {});
    } else {
      AudioService.playFromAssets('data/try_again.ogg');
      setState(() {
        isNiceTry = true;
        points.clear();
      });
      Future.delayed(
        const Duration(seconds: 4),
        () {
          setState(() {
            isNiceTry = false;
          });
        },
      );
      print('correct: $correct');
      print('answer: $selectText');
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<String> imageToText() async {
    final Uint8List? bytes = await widgetController.capture();
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer
        .processImage(InputImage.fromFile(File.fromRawPath(bytes!)));
    String text = recognizedText.text;
    selectText = text;
    setState(() {});
    return text;
  }
}
