import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learning_english/common/services/local_data.dart';

import 'widgets/lesson_container.dart';

class WordsLearnView extends StatelessWidget {
  const WordsLearnView({super.key});
  static const id = 'WordsLearnView';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final bool isWordsTest = arguments['isWordsTest'];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: index == 0,
                  child: const Gap(15),
                ),
                Align(
                  child: WordsLessonContainer(
                    lessonIndex: index,
                    isWordsTest: isWordsTest,
                  ),
                ),
                Visibility(
                  visible: index == LocalData.lessons.length - 1,
                  child: const Gap(15),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const Gap(20),
            itemCount: LocalData.lessons.length,
          ),
        ),
      ),
    );
  }
}
