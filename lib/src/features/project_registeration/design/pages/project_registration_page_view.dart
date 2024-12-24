import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/components/main_button.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../manager/project_register_controller.dart';
import '../widgets/input_section_doctor.dart';
import '../widgets/input_section_project.dart';
import '../widgets/input_section_student.dart';

class ProjectRegistrationPageView extends StatelessWidget {
  const ProjectRegistrationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectRegisterControllerImp controller =
        Get.put(ProjectRegisterControllerImp());

    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Project Registration',
        centerTitle: true,
        height: 70,
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(20),
        children: [
          InputSectionStudent(
            nameController: controller.studentNameController,
            idController: controller.studentIdController,
          ),
          const SizedBox(height: 20),
          const InputSectionDoctor(),
          const SizedBox(height: 20),
          const InputSectionProject(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 20),
            child: MainButton(
              onPressed: controller.submit,
              text: 'Submit',
            ),
          ),
        ],
      ),
    );
  }
}
