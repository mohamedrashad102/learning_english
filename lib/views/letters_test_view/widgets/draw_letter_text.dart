import 'package:flutter/material.dart';

class DrawLetterText extends StatelessWidget {
  const DrawLetterText({
    super.key,
    required this.letter,
  });

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${letter.toUpperCase()} ${letter.toLowerCase()} قم بكتابه ',
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}


// 16580