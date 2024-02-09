import 'package:flutter/material.dart';
import 'package:learning_english/common/helpers/show_toast.dart';
import 'package:learning_english/common/models/lesson_model.dart';
import 'package:learning_english/common/models/word_model.dart';
import 'package:learning_english/common/services/stt_service.dart';
import 'package:learning_english/views/words_test_view/words_test_view.dart';

import '../../common/services/local_data.dart';
import '../../common/services/tts_service.dart';
import 'widgets/word_container.dart';

class LessonWordsView extends StatefulWidget {
  const LessonWordsView({
    super.key,
  });
  static const id = 'LessonWordsView';

  @override
  State<LessonWordsView> createState() => _LessonWordsViewState();
}

class _LessonWordsViewState extends State<LessonWordsView> {
  String _result = '';
  bool showResult = false;
  int currentWordIndex = -1;
  // final ValueNotifier<bool> _showResultNotifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final int lessonIndex = arguments['lessonIndex'];
    final bool isWordsTest = arguments['isWordsTest'];
    LessonModel lesson = LocalData.lessons[lessonIndex];
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.9 / 1,
          ),
          itemBuilder: (context, wordIndex) {
            Color color = LocalData.colors[wordIndex % LocalData.colors.length];
            WordModel word = lesson.words[wordIndex];
            return WordContainer(
              animate: currentWordIndex == wordIndex,
              color: color,
              bgColor: Colors.teal.shade700,
              word: word,
              isWordsTest: isWordsTest,
              onTap: () {
                if (isWordsTest) {
                  Navigator.pushNamed(context, WordsTestView.id, arguments: {
                    'word': word,
                  });
                } else {
                  TtsService.speak(word.wordInEnglish);
                }
              },
              onMicPress: () async {
                if (currentWordIndex == -1) {
                  currentWordIndex = wordIndex;
                  showResult = true;
                  setState(() {});
                  showToast('تحدث...');
                  STTService.speechToText.listen(
                    localeId: 'en_US',
                    onResult: (result) {
                      _result = result.recognizedWords;

                      if (result.finalResult) {
                        _testWord(word);
                        setState(() {
                          currentWordIndex = -1;
                        });
                        STTService.speechToText.stop();
                      }

                      // Future.delayed(const Duration(milliseconds: 500), () {
                      // });
                    },
                    // listenOptions: SpeechListenOptions(
                    //   sampleRate: 0,
                    //   partialResults: true,
                    // )
                  );
                } else {
                  currentWordIndex = -1;
                  STTService.speechToText.stop();

                  setState(() {});
                }
              },
              // onLongPressEnd: (_) {
              //   // _testWord(word);
              // },
            );
          },
          itemCount: lesson.words.length,
        ),
      ),
    );
  }

  _testWord(WordModel word) {
    String correctAnswer = word.wordInEnglish.replaceAll(' ', '').toLowerCase();
    String answer = _result.split(' ').toList().last.toLowerCase();
    print(answer);
    print(correctAnswer);
    if (answer == correctAnswer) {
      showToast('أحسنت');
    } else {
      showToast('جرب تاني');
    }
    // if (STTService.speechToText.isNotListening && showResult) {
    // showResult = false;
    // }
  }
}
