import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final FlutterTts _flutterTts = FlutterTts();

  static initialize() {
    _flutterTts.getVoices;
  }

  static List<Map> lovelyVoices = [
    {'name': 'en-us-x-iol-local', 'locale': 'en-US'}, // very nice
  ];

  static speak(String text) async {
    // List voices = await _flutterTts.getVoices;
    // for (var voice in voices) {
    //   var name = voice['name'];
    //   var locale = voice['locale'];
    //   if (locale == 'en-US') {
    //     print("{'name': '$name', 'locale': '$locale'}");
    //   }
    // }
    // _flutterTts.setSpeechRate(0.4);
    _flutterTts.setVoice({'name': 'en-us-x-iol-local', 'locale': 'en-US'});
    _flutterTts.speak(text);
  }
}
/*
{'name': 'en-us-x-tpf-local', 'locale': 'en-US'}
{'name': 'en-us-x-sfg-network', 'locale': 'en-US'}
{'name': 'en-us-x-sfg-local', 'locale': 'en-US'}
{'name': 'en-us-x-iob-local', 'locale': 'en-US'}
{'name': 'en-us-x-tpd-network', 'locale': 'en-US'}
{'name': 'en-us-x-tpc-network', 'locale': 'en-US'}
{'name': 'en-us-x-iob-network', 'locale': 'en-US'}
{'name': 'en-us-x-iol-network', 'locale': 'en-US'}
{'name': 'en-us-x-iom-network', 'locale': 'en-US'}
{'name': 'en-us-x-iom-local', 'locale': 'en-US'}
{'name': 'en-US-language', 'locale': 'en-US'}
{'name': 'en-us-x-tpd-local', 'locale': 'en-US'}
{'name': 'en-us-x-iog-network', 'locale': 'en-US'}
{'name': 'en-us-x-tpf-network', 'locale': 'en-US'}
{'name': 'en-us-x-iog-local', 'locale': 'en-US'}
{'name': 'en-us-x-tpc-local', 'locale': 'en-US'}
{'name': 'en-us-x-iol-local', 'locale': 'en-US'}

*/