import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../common/services/local_data.dart';
import '../../drawing_letters_lesson_view/drawing_letters_lesson_view.dart';
import '../../spelling_letters_lesson_view/spelling_letters_lesson_view.dart';
import '../../words_learn_view/words_learn_view.dart';

class StageContainer extends StatelessWidget {
  const StageContainer({
    super.key,
    required this.stageContent,
    required this.stageIndex,
  });
  final String stageContent;
  final int stageIndex;

  static const _stageInArabic = 'المرحله';

  static const List<String> stagesViews = [
    SpellingLettersLessonView.id,
    DrawingLettersLessonView.id,
    SpellingLettersLessonView.id,
    WordsLearnView.id,
    WordsLearnView.id,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        stagesViews[stageIndex],
        arguments: {
          'isLettersTest': stageIndex == 2,
          'isWordsTest': stageIndex == 4,
        },
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: LocalData.colors[stageIndex],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              '$_stageInArabic ${LocalData.numbersInArabic[stageIndex]}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(3),
            Text(
              stageContent,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
