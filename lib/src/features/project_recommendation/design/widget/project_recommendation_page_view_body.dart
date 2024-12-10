import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';
import 'package:graduation_gate_way/src/core/widgets/main_button.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/button_with_icon.dart';
import 'answer_container.dart';
import 'answer_widget.dart';

class ProjectRecommendationPageViewBody extends StatelessWidget {
  const ProjectRecommendationPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          ).paddingOnly(left: 20, top: 20),
          SizedBox(
            height: 0.50.sh,
            width: 1.sw,
            child: PageView(
              children: const [
                AnswerContainer(),
                AnswerContainer(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40.h,
                width: 120.w,
                child: ButtonWithIcon(
                  onPressed: () {},
                  text: 'Back',
                  iconAlignment: IconAlignment.start,
                  icon: Icons.arrow_back,
                ),
              ),
              SizedBox(
                height: 40.h,
                width: 120.w,
                child: ButtonWithIcon(
                  onPressed: () {},
                  text: 'Next',
                  icon: Icons.arrow_forward,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
