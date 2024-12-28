import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/custom_text_form_field.dart';
import 'package:graduation_gate_way/src/features/project_registeration/design/manager/project_register_controller.dart';

import '../../../../core/widgets/components/surface_container.dart';

class InputSectionProject extends StatelessWidget {
  const InputSectionProject({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectRegisterControllerImp controller =
        Get.find<ProjectRegisterControllerImp>();
    return SurfaceContainer(
      child: Column(
        children: [
          const Text('Project Input Section'),
          CustomTextFormField(
            controller: controller.projectNameController,
            labelText: 'Project Name',
            borderColor: Colors.black,
            textInputType: TextInputType.name,
            radius: 20,
            suffixIcon: Icons.add,
          ),
          CustomTextFormField(
            controller: controller.descriptionController,
            textInputType: TextInputType.multiline,
            labelText: 'Project description',
            borderColor: Colors.black,
            maxLines: 5,
            radius: 20,
          )
        ],
      ),
    );
  }
}
