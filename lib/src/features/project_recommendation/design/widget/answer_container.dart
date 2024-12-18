import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/multi_answer_search.dart';
import 'answers_list.dart';

class AnswerContainer extends StatelessWidget {
  final QuestionModel? questionModel;
  final int? totalQuestions;

  const AnswerContainer({super.key, this.questionModel, this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteBackGround,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Question ${questionModel?.index}/${totalQuestions ?? 2}',
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${questionModel?.index}- ${questionModel?.question}',
              style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.black),
            ),
          ).paddingLeft(20),
          questionModel!.type == 'choice'
              ? AnswersListView(
                  answers: questionModel!.answers,
                  questionModel: questionModel!,
                )
              : AnswersMultipleSearch(
                  answers: questionModel!.answers,
                  searchEnabled: true,
                  selectionListAnswerMethod:
                      questionModel!.selectionListAnswerMethod,
                ),
        ],
      ),
    );
  }
}

class QuestionModel {
  final int index;
  final String question;
  final List<String> answers;
  final String type;
  final void Function(List<String>)? selectionListAnswerMethod;
  final void Function(String)? selectionAnswerMethod;

  QuestionModel({
    required this.index,
    required this.question,
    required this.answers,
    this.type = 'choice',
    this.selectionListAnswerMethod,
    this.selectionAnswerMethod,
  });
}
