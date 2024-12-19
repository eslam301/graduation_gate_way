import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';

import '../../../../core/widgets/multi_answer_search.dart';
import 'answers_list.dart';

class AnswerContainer extends StatelessWidget {
  final QuestionModel questionModel;
  final int totalQuestions;

  const AnswerContainer(
      {super.key, required this.questionModel, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SurfaceContainer(
      borderRadius: 20,
      margin: 20,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Question ${questionModel.index}/$totalQuestions',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.primaryColor,
                  ))),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${questionModel.index}- ${questionModel.question}',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          questionModel.type == 'choice'
              ? AnswersListView(
                  answers: questionModel.answers,
                  questionModel: questionModel,
                )
              : AnswersMultipleSearch(
                  answers: questionModel.answers,
                  searchEnabled: true,
                  selectionListAnswerMethod:
                      questionModel.selectionListAnswerMethod,
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
