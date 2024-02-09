import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learning_english/views/drawing_letters_lesson_view/widgets/board.dart';

class BoardView extends StatelessWidget {
  const BoardView({
    super.key,
  });
  static const id = 'BoardView';

  @override
  Widget build(BuildContext context) {
    final boardKey = GlobalKey();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String letter = arguments['letter'];
    final Color color = arguments['color'];
    final size = MediaQuery.sizeOf(context).width - 40;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'لون الحرف',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(5),
                Board(
                  boardKey: boardKey,
                  boardWidth: size,
                  boardHeight: size,
                  letter: letter,
                  letterColor: color,
                  letterFontSize: size * 0.65,
                  letterFontWeight: FontWeight.w900,
                  painterStrokeWidth: size * 0.04,
                  letterStrokeWidth: size * 0.04,
                  cleanIcon: const Icon(
                    Icons.cleaning_services_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  boardDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
