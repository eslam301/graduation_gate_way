import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/components/error_message_widget.dart';
import '../manager/my_projects_doctor_controller.dart';
import '../widgets/my_project_body.dart';

class MyProjectDoctorPageView extends StatelessWidget {
  const MyProjectDoctorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProjectDoctorController controller =
        Get.put(MyProjectDoctorController());
    return Scaffold(
        appBar: generalAppBar(
          title: 'My Project',
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.errorMessage.isNotEmpty) {
            return ErrorMessageWidget(
              message: controller.errorMessage.value,
            );
          }
          return MyProjectsDoctorBody(
            projectList: controller.projectList,
          );
        }));
  }
}
