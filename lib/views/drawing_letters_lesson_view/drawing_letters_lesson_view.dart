import 'package:flutter/material.dart';

import '../../common/services/local_data.dart';
import '../../common/widgets/letter_container.dart';
import 'board_view.dart';

class DrawingLettersLessonView extends StatelessWidget {
  const DrawingLettersLessonView({super.key});
  static const id = 'DrawingLettersLessonView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            int letterIndex = index ~/ 2;
            bool isCapital = index % 2 == 0;
            String letter = isCapital
                ? LocalData.letters[letterIndex].toUpperCase()
                : LocalData.letters[letterIndex].toLowerCase();
            Color color =
                LocalData.colors[letterIndex % LocalData.colors.length];
            return LetterContainer(
              color: color,
              letter: letter,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  BoardView.id,
                  arguments: {
                    'letter': letter,
                    'color': color,
                  },
                );
              },
            );
          },
          itemCount: LocalData.letters.length * 2,
        ),
      ),
    );
  }
}
