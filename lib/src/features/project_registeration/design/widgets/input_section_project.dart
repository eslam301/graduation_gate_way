import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/custom_text_form_field.dart';
import 'package:graduation_gate_way/src/features/project_registeration/design/manager/project_register_controller.dart';

class InputSectionProject extends StatelessWidget {
  const InputSectionProject({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectRegisterControllerImp controller =
        Get.find<ProjectRegisterControllerImp>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Project Input Section'),
            CustomTextFormField(
              controller: controller.projectNameController,
              labelText: 'Project Name',
              borderColor: Colors.black,
              radius: 20,
              suffixIcon: Icons.add,
            ),
            CustomTextFormField(
              controller: controller.descriptionController,
              labelText: 'Project description',
              borderColor: Colors.black,
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
