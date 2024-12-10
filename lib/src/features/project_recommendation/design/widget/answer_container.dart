import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../../../../core/theme/app_color.dart';
import 'answer_widget.dart';

class AnswerContainer extends StatelessWidget {
  const AnswerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 0.50.sh,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteBackGround,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Question 1/10',
              style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.mainColor),
            ),
          ).paddingLeft(20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '1- What is your major?',
              style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.black),
            ),
          ).paddingLeft(20),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 20 , left: 20 , right: 20 , bottom: 10),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => AnswerWidget(
                title: 'Answer $index',
              ),
            ),
          )
        ],
      ),
    );
  }
}
