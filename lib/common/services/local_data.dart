import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:learning_english/common/models/lesson_model.dart';

abstract class LocalData {
  static final List<LessonModel> lessons = [];
  static final List<String> stagesContent = [];
  static final List<String> numbersInArabic = [];
  static const String letters = 'abcdefghijklmnopqrstuvwxyz';
  static final List<Color> colors = [];

  static readData() async {
    final data = await _readJsonFile();
    _initLessons(data);
    _initStagesContent(data);
    _initNumbersInArabic(data);
    _initColors(data);
  }

  static Future<Map<String, dynamic>> _readJsonFile() async {
    try {
      var filePath = 'assets/data/json_data.json';
      var response = await rootBundle.loadString(filePath);
      var map = jsonDecode(response);
      return map;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  static _initLessons(data) {
    lessons
      ..clear
      ..addAll(
        (data['lessons'] as List).map(
          (jsonLesson) => LessonModel.fromJson(jsonLesson),
        ),
      );
  }

  static _initStagesContent(data) {
    stagesContent
      ..clear()
      ..addAll(
        List.from(data['stagesContent']),
      );
  }

  static _initNumbersInArabic(data) {
    numbersInArabic
      ..clear()
      ..addAll(
        List.from(data['numbersInArabic']),
      );
  }

  static _initColors(data) {
    colors
      ..clear()
      ..addAll(
        (data['colors'] as List).map(
          (color) => Color(
            0xFF000000 + int.parse(color, radix: 16),
          ),
        ),
      );
  }
}
