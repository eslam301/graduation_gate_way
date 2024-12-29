import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../core/widgets/multi_answer_search.dart';
import '../../../project_registeration/data/models/project_model.dart';
import '../manager/grades_controller.dart';
import 'grade_table.dart';

class GradesBody extends StatelessWidget {
  const GradesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GradesController>();
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
          MultiDropDownWidget(
            isSingleSelect: true,
            isFuturesEnabled: true,
            searchEnabled: true,
            selectionListAnswerMethodObject: (value) {
              if (value.isEmpty || value[0] == null) {
                log('Selection is empty');
                return;
              }
              int? id = int.tryParse(value[0].toString());
              if (id != null) {
                log(id.toString());
                controller.selectProjectId(id);
              } else {
                log('Invalid doctor ID');
              }
            },
            fetchItemsFuture: () async {
              List<ProjectModel> doctors = await controller.getProjects();
              return doctors
                  .map((e) => DropdownItem(
                        label: e.name ?? '',
                        value: e.id ?? 0,
                      ))
                  .toList();
            },
          ),
          const SizedBox(height: 10),
          // Add spacing for better UI.
          const GradeTable()
          // Update table when grades change.
        ],
      ),
    );
  }
}
