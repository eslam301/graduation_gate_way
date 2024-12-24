import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../manager/my_project_controller.dart';
import '../widgets/my_project_body.dart';

class MyProjectPageView extends StatelessWidget {
  const MyProjectPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProjectController controller = Get.put(MyProjectController());
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'My Project',
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        final project = controller.myProject.value;
        return MyProjectBody(
          myProject: project,
        );
      }),
    );
  }
}
