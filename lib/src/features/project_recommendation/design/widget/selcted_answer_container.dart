import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/project_recommendation_controller.dart';

class SelectedAnswerContainer extends StatelessWidget {
  const SelectedAnswerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.find<ProjectRecommendationControllerImp>();
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GetBuilder<ProjectRecommendationControllerImp>(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills : ${controller.selectedSkills.join(', ')}',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'difficulty :${controller.selectedDifficulty}',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'categories :${controller.selectedCategories.join(', ')}',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'keywords :${controller.selectedKeywords.join(', ')}',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        );
      }),
    );
  }
}
