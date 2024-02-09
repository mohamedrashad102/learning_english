import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../common/services/local_data.dart';
import 'widgets/stage_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              children: [
                Visibility(
                  visible: index == 0,
                  child: const Gap(15),
                ),
                Align(
                  child: StageContainer(
                    stageContent: LocalData.stagesContent[index],
                    stageIndex: index,
                  ),
                ),
                Visibility(
                  visible: index == LocalData.stagesContent.length - 1,
                  child: const Gap(15),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const Gap(20),
            itemCount: LocalData.stagesContent.length,
          ),
        ),
      ),
    );
  }
}
