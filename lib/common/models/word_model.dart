import 'package:flutter/material.dart';

class WordModel {
  final String wordInArabic;
  final String wordInEnglish;
  final String photo;
  final Color? color;

  const WordModel({
    required this.wordInArabic,
    required this.wordInEnglish,
    required this.photo,
    this.color,
  });

  factory WordModel.fromJson(
    Map<String, dynamic> json,
    String base,
  ) {
    return WordModel(
      wordInArabic: json['wordInArabic'],
      wordInEnglish: json['wordInEnglish'],
      photo: base + json['photo'],
      color: json['color'] != null
          ? Color(
              0xFF000000 + int.parse(json['color'], radix: 16),
            )
          : null,
    );
  }
}
