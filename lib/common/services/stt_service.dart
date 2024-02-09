import 'package:speech_to_text/speech_to_text.dart';

abstract class STTService {
  static final SpeechToText speechToText = SpeechToText();

  static void initialize() async {
    await speechToText.initialize();
  }
}
