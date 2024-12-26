import 'package:flutter/material.dart';

import '../../../../core/widgets/multi_answer_search.dart';
import '../manager/grades_controller.dart';
import 'grade_table.dart';

class GradesBody extends StatelessWidget {
  final GradesController controller;

  const GradesBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Results May/Jan 2025',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const MultiDropDownWidget(
            hintText: 'Select Project',
          ),
          const GradeTable(),
        ],
      ),
    );
  }
}
