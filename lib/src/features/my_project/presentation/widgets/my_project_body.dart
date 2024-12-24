import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';

import '../../../../core/api/models/my_project_model.dart';

class MyProjectBody extends StatelessWidget {
  final MyProjectModel? myProject;

  const MyProjectBody({super.key, this.myProject});

  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      margin: 30,
      child: Column(
        children: [
          Text('Title: ${myProject!.projectName!}'),
          const SizedBox(height: 10),
          Text('Description:${myProject!.description!}'),
          const SizedBox(height: 10),
          Text(myProject!.proposalFileName!),
          const SizedBox(height: 10),
          Text('Students:${myProject!.students.toString()}'),
        ],
      ),
    );
  }
}
