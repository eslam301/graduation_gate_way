import 'package:flutter/material.dart';

import '../../../project_registeration/data/models/project_model.dart';
import 'doctor_project_container.dart';

class MyProjectsDoctorBody extends StatelessWidget {
  final List<ProjectModel> projectList;

  const MyProjectsDoctorBody({super.key, required this.projectList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projectList.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return DoctorProjectContainer(
          project: projectList[index],
        );
      },
    );
  }
}
