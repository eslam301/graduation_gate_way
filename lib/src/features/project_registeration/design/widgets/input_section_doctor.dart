import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/features/project_registeration/design/manager/project_register_controller.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../project_recommendation/design/widget/multi_answer_search.dart';

class InputSectionDoctor extends StatelessWidget {
  const InputSectionDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProjectRegisterControllerImp controller =
        Get.find<ProjectRegisterControllerImp>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AnswersMultipleSearch(
              isSingleSelect: true,
              isFuturesEnabled: true,
              searchEnabled: true,
              selectionListAnswerMethodObject: (value) {
                value.forEach((element) {
                  log(element.toString());
                });
              },
              fetchAnswersFuture: () async {
                List<DoctorModel> doctors = await controller.getDoctors();
                return doctors
                    .map((e) => DropdownItem(
                          label: e.fullName ?? e.userName ?? '',
                          value: e.id ?? 0,
                        ))
                    .toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
