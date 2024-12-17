import 'package:flutter/cupertino.dart';

import '../manager/project_register_controller.dart';
import 'input_section_doctor.dart';
import 'input_section_project.dart';

class DoctorAndProjectInputSection extends StatelessWidget {
  final ProjectRegisterControllerImp controller;

  const DoctorAndProjectInputSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20), children: const [
      InputSectionDoctor(),
      SizedBox(height: 20),
      InputSectionProject()
    ]);
  }
}
