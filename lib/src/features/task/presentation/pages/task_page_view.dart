import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../manager/task_controller.dart';
import '../widgets/task_body.dart';

class TaskPageView extends StatelessWidget {
  const TaskPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());
    return Scaffold(
        endDrawer: const CustomDrawer(),
        appBar: generalAppBar(title: 'tasks'),
        body: Obx(() {
          return controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : TasksBody(
                  tasks: controller.tasks,
                );
        }));
  }
}
