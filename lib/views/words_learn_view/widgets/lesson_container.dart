import 'package:flutter/material.dart';
import 'package:learning_english/views/words_learn_view/lesson_words_view.dart';

import '../../../common/services/local_data.dart';

class WordsLessonContainer extends StatelessWidget {
  const WordsLessonContainer({
    super.key,
    required this.isWordsTest,
    required this.lessonIndex,
  });
  final int lessonIndex;
  final bool isWordsTest;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, LessonWordsView.id, arguments: {
        'lessonIndex': lessonIndex,
        'isWordsTest': isWordsTest,
      }),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: LocalData.colors[lessonIndex],
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          LocalData.lessons[lessonIndex].title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
