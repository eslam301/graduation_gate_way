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
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GetBuilder<ProjectRecommendationControllerImp>(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(text: 'Skills: ', children: <InlineSpan>[
                TextSpan(
                  text: controller.selectedSkills.join(', '),
                  style: theme.textTheme.bodyMedium?.copyWith(),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text.rich(
              TextSpan(text: 'categories: ', children: <InlineSpan>[
                TextSpan(
                  text: controller.selectedCategories.join(', '),
                  style: theme.textTheme.bodyMedium?.copyWith(),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text.rich(
              TextSpan(text: 'keywords: ', children: <InlineSpan>[
                TextSpan(
                  text: controller.selectedKeywords.join(', '),
                  style: theme.textTheme.bodyMedium?.copyWith(),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text.rich(
              TextSpan(text: 'Difficulty level: ', children: <InlineSpan>[
                TextSpan(
                  text: controller.selectedDifficulty,
                  style: theme.textTheme.bodyMedium?.copyWith(),
                ),
              ]),
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
