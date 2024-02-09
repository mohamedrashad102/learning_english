import 'package:flutter/material.dart';

class LetterContainer extends StatelessWidget {
  const LetterContainer({
    super.key,
    required this.letter,
    required this.color,
    this.onTap,
  });
  final String letter;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: FittedBox(
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
