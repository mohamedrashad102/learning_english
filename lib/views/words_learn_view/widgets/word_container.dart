import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learning_english/common/models/word_model.dart';

class WordContainer extends StatelessWidget {
  const WordContainer({
    super.key,
    required this.word,
    required this.color,
    required this.bgColor,
    required this.isWordsTest,
    required this.animate,
    this.onTap,
    this.onMicPress,
  });
  final WordModel word;
  final Color color;
  final Color bgColor;
  final Function()? onTap;
  final Function()? onMicPress;
  final bool isWordsTest;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    word.photo,
                    color: word.color,
                  ),
                ),
                const Gap(7),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    word.wordInArabic,
                    style: TextStyle(
                      fontSize: 23,
                      height: 1,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Visibility(
                  visible: !isWordsTest,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      word.wordInEnglish,
                      style: TextStyle(
                        fontSize: 23,
                        height: 1,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Text(
                //       word.wordInEnglish,
                //       style: TextStyle(
                //         fontSize: 22,
                //         color: Colors.white.withOpacity(0.8),
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     const Spacer(),
                //     Text(
                //       word.wordInArabic,
                //       style: TextStyle(
                //         fontSize: 22,
                //         color: Colors.white.withOpacity(0.8),
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AvatarGlow(
              animate: animate,
              glowColor: !animate
                  ? Colors.transparent.withOpacity(0.5)
                  : Colors.teal.shade300,
              glowShape: BoxShape.circle,
              glowRadiusFactor: 0.1,
              curve: Curves.easeOutCirc,
              duration: const Duration(milliseconds: 1000),
              repeat: true,
              child: IconButton(
                onPressed: onMicPress,
                icon: Icon(
                  animate ? Icons.mic : Icons.mic_off,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
