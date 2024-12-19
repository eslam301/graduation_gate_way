import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/features/project_registeration/design/manager/project_register_controller.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../core/widgets/components/surface_container.dart';
import '../../../../core/widgets/multi_answer_search.dart';

class InputSectionDoctor extends StatelessWidget {
  const InputSectionDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProjectRegisterControllerImp controller =
        Get.find<ProjectRegisterControllerImp>();
    return SurfaceContainer(
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
              int? id = int.parse(value[0].toString());
              log(id.toString());
              controller.addDoctorId(id);
            },
            fetchAnswersFuture: () async {
              List<DoctorModel> doctors = await controller.getDoctors();
              return doctors
                  .map((e) => DropdownItem(
                        label: e.fullName ?? e.username ?? '',
                        value: e.id ?? 0,
                      ))
                  .toList();
            },
          ),
        ],
      ),
    );
  }
}