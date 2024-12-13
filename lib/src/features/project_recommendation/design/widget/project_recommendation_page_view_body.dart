import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/button_with_icon.dart';
import '../controller/project_recommendation_controller.dart';
import 'answer_container.dart';

class ProjectRecommendationPageViewBody extends StatelessWidget {
  const ProjectRecommendationPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectRecommendationControllerImp controller =
        Get.find<ProjectRecommendationControllerImp>();
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Answer questions for \nproject recommendation.',
              style: theme.textTheme.bodySmall?.copyWith(
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
              children: [
                ...List.generate(
                  controller.questions.length,
                  (index) => AnswerContainer(
                    totalQuestions: controller.questions.length,
                    questionModel: controller.questions[index],
                  ),
                ),
                Obx (()=> Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GetBuilder<ProjectRecommendationControllerImp>(
                      builder: (context) {
                    return  Column(
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
                ).loadable(isLoading: controller.loading.value)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40.h,
                width: 130.w,
                child: ButtonWithIcon(
                  onPressed: () {
                    controller.previousQuestion();
                  },
                  text: 'Back',
                  iconAlignment: IconAlignment.start,
                  icon: Icons.arrow_back,
                ),
              ),
              Obx(() => SizedBox(
                    height: 40.h,
                    width: 130.w,
                    child: ButtonWithIcon(
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
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
