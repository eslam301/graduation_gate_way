import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/features/project_recommendation/design/widget/answer_container.dart';

import '../../../../core/theme/app_color.dart';

class AnswersListView extends StatefulWidget {
  final List<String> answers; // List of choices to display in the list view>
  final QuestionModel questionModel;
  const AnswersListView(
      {super.key, required this.answers, required this.questionModel});

  @override
  State<AnswersListView> createState() => _AnswersListViewState();
}

class _AnswersListViewState extends State<AnswersListView> {
  int? _selectedValue; // Holds the currently selected value.

  @override
  Widget build(BuildContext context) {
    // Sample choices
    final List<String> choices = widget.answers;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: choices.length,
          itemBuilder: (context, index) {
            final bool isSelected = _selectedValue == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedValue = index; // Update selected value
                  widget.questionModel.selectionAnswerMethod!(
                    choices[index],
                  );
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.mainColor
                      : AppColors.whiteBackGround,
                  borderRadius: BorderRadius.circular(isSelected ? 25 : 20),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.mainColor.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ]
                      : [],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Choice text
                    Text(
                      choices[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: isSelected ? AppColors.white : AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Animated Radio Button
                    AnimatedScale(
                      scale: isSelected ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Radio<int>(
                        value: index,
                        groupValue: _selectedValue,
                        activeColor: AppColors.white,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
