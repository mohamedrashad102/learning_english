import 'package:flutter/material.dart';

class DrawWordText extends StatelessWidget {
  const DrawWordText({
    super.key,
    required this.word,
  });

  final String word;

  @override
  Widget build(BuildContext context) {
    return Text(
      '"معني كلمه "$word',
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}


// 16580