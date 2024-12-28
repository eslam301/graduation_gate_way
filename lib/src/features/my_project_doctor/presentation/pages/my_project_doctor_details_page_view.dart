import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/components/border_container.dart';
import '../../../my_project/presentation/widgets/student_card.dart';
import '../../../project_registeration/data/models/project_model.dart';
import '../manager/my_projects_doctor_controller.dart';

class MyProjectDoctorDetailsPageView extends StatelessWidget {
  final ProjectModel? project;

  const MyProjectDoctorDetailsPageView({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyProjectDoctorController>();
    return Scaffold(
      appBar: generalAppBar(
        title: 'My Project',
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 120),
        child: Column(
          children: [
            Text(project?.name ?? '',
                style: Theme.of(context).textTheme.titleMedium),
            10.verticalSpace,
            Card(
              surfaceTintColor: Theme.of(context).colorScheme.surface,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Text(
                  project?.categoryName ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            10.verticalSpace,
            BorderContainer(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: project?.students?.length ?? 0,
                  itemBuilder: (context, index) {
                    return StudentCard(
                        name: project?.students![index].name ?? '',
                        idString: project?.students![index].id.toString());
                  }),
            ),
            10.verticalSpace,
            BorderContainer(
              color: Theme.of(context).colorScheme.surface,
              width: double.infinity,
              height: 200,
              child: Text(
                project?.description ?? '',
              ),
            ),
            10.verticalSpace,
            MainButton(
                onPressed: () {
                  controller.tasks();
                },
                text: 'Tasks')
          ],
        ),
      ),
    );
  }
}
