import 'package:learning_english/common/models/word_model.dart';

class LessonModel {
  final String title;
  final List<WordModel> words;

  const LessonModel({
    required this.title,
    required this.words,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    var wordsList = json['words'] as List;
    List<WordModel> words = wordsList
        .map((wordJson) => WordModel.fromJson(wordJson, json['base']))
        .toList();

    return LessonModel(
      title: json['title'],
      words: words,
    );
  }
}
