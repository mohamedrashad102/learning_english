import 'package:flutter/material.dart';

class BoardLetter extends StatelessWidget {
  const BoardLetter(
    this.letter, {
    super.key,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.strokeWidth,
  });
  final String letter;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Text(
          letter,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            backgroundColor: Colors.transparent,
            color: Colors.grey.shade300,
          ),
        ),
        // Implement the stroke
        Text(
          letter,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            backgroundColor: Colors.transparent,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeCap = StrokeCap.round
              ..strokeWidth = strokeWidth
              ..color = color,
          ),
        ),
      ],
    );
  }
}
