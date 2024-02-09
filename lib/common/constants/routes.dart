import 'package:learning_english/views/drawing_letters_lesson_view/board_view.dart';
import 'package:learning_english/views/drawing_letters_lesson_view/drawing_letters_lesson_view.dart';
import 'package:learning_english/views/home_view/home_view.dart';
import 'package:learning_english/views/letters_test_view/letters_test_view.dart';
import 'package:learning_english/views/spelling_letters_lesson_view/spelling_letters_lesson_view.dart';
import 'package:learning_english/views/words_learn_view/lesson_words_view.dart';
import 'package:learning_english/views/words_learn_view/words_learn_view.dart';
import 'package:learning_english/views/words_test_view/words_test_view.dart';

final appRoutes = {
  HomeView.id: (context) => const HomeView(),
  BoardView.id: (context) => const BoardView(),
  SpellingLettersLessonView.id: (context) => const SpellingLettersLessonView(),
  DrawingLettersLessonView.id: (context) => const DrawingLettersLessonView(),
  LettersTestView.id: (context) => const LettersTestView(),
  WordsLearnView.id: (context) => const WordsLearnView(),
  LessonWordsView.id: (context) => const LessonWordsView(),
  WordsTestView.id: (context) => const WordsTestView(),
};
