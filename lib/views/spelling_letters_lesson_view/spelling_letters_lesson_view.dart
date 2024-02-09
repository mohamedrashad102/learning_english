import 'package:flutter/material.dart';
import 'package:learning_english/common/services/tts_service.dart';
import 'package:learning_english/views/letters_test_view/letters_test_view.dart';

import '../../common/services/local_data.dart';
import '../../common/widgets/letter_container.dart';

class SpellingLettersLessonView extends StatefulWidget {
  const SpellingLettersLessonView({super.key});
  static const id = 'SpellingLettersLessonView';

  @override
  State<SpellingLettersLessonView> createState() =>
      _SpellingLettersLessonViewState();
}

class _SpellingLettersLessonViewState extends State<SpellingLettersLessonView> {
  @override
  void setState(VoidCallback fn) {
    TtsService.initialize();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    bool isTest = arguments['isLettersTest'];
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            Color color = LocalData.colors[index % LocalData.colors.length];
            String letter = LocalData.letters[index];
            return LetterContainer(
              color: color,
              letter: letter.toUpperCase(),
              onTap: () {
                if (isTest) {
                  Navigator.pushNamed(
                    context,
                    LettersTestView.id,
                    arguments: {
                      'letter': letter,
                    },
                  );
                } else {
                  TtsService.speak(letter);
                }
              },
            );
          },
          itemCount: LocalData.letters.length,
        ),
      ),
    );
  }
}
