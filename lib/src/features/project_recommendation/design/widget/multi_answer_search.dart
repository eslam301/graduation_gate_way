import 'package:flutter/material.dart';

import 'package:graduation_gate_way/src/features/project_recommendation/design/widget/answer_container.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../core/theme/app_color.dart';

class AnswersMultipleSearch extends StatelessWidget {
  final QuestionModel questionModel;
  final Key? myKey;

  const AnswersMultipleSearch({
    super.key,
    required this.questionModel,
    this.myKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MultiDropdown(
        onSelectionChange: (value) {
          questionModel.selectionListAnswerMethod!(value);
        },
        key: myKey,
        searchEnabled: true,
        closeOnBackButton: true,
        fieldDecoration: const FieldDecoration(
          labelText: 'Select answers',
          labelStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.black,
              width: 2,
            ),
          ),
        ),
        dropdownDecoration: const DropdownDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          backgroundColor: AppColors.whiteBackGround,
        ),
        dropdownItemDecoration: const DropdownItemDecoration(
          selectedBackgroundColor: AppColors.mainColor,
        ),
        searchDecoration: const SearchFieldDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.black,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.black,
              width: 2,
            ),
          ),
          hintText: 'Search',
        ),
        chipDecoration: const ChipDecoration(
          backgroundColor: AppColors.grey,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          labelStyle: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        items: [
          ...List.generate(
            questionModel.answers.length,
            (index) => DropdownItem(
              value: questionModel.answers[index],
              label: questionModel.answers[index],
            ),
          )
        ],
      ),
    );
  }
}
