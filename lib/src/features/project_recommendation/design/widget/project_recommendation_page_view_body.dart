import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/button_with_icon.dart';
import '../controller/project_recommendation_controller.dart';
import 'answer_container.dart';

class ProjectRecommendationPageViewBody extends StatelessWidget {
  final ProjectRecommendationControllerImp controller;

  const ProjectRecommendationPageViewBody(
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Answer questions for \nproject recommendation.',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ).paddingOnlyIn(left: 20, top: 20),
          SizedBox(
            height: 0.50.sh,
            width: 1.sw,
            child: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              allowImplicitScrolling: true,
              children: [
                ...List.generate(
                  controller.questions.length,
                  (index) => AnswerContainer(
                    totalQuestions: controller.questions.length,
                    questionModel: controller.questions[index],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GetBuilder<ProjectRecommendationControllerImp>(
                      builder: (context) {
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
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
                width: 130,
                child: ButtonWithIcon(
                  onPressed: () {
                    controller.previousQuestion();
                  },
                  text: 'Back',
                  iconAlignment: IconAlignment.start,
                  icon: Icons.arrow_back,
                ),
              ),
              SizedBox(
                height: 40,
                width: 130,
                child: Obx(() {
                  return ButtonWithIcon(
                    color: controller.isLastPage()
                        ? AppColors.mainColorShaded
                        : AppColors.mainColor,
                    onPressed: () {
                      controller.isLastPage()
                          ? controller.submit()
                          : controller.nextQuestion();
                    },
                    text: controller.isLastPage() ? 'Submit' : 'Next',
                    icon: Icons.arrow_forward,
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
