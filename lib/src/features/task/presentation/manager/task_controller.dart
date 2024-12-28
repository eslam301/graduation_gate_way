import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/functions/validator.dart';
import 'package:graduation_gate_way/src/core/widgets/components/custom_text_form_field.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';
import 'package:graduation_gate_way/src/features/task/data/models/task_model.dart';

import '../../data/data_sources/tasks_data_source.dart';
import '../../domain/use_cases/update_task.dart';

class TaskController extends GetxController {
  TextEditingController finishedWeekController = TextEditingController();

  List<TaskModel> tasks = [];
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  updateTaskk(TaskModel task, bool isDone) async {
    print("task is ${task.toString()}");

    final TaskModel updatedTask = task.copyWith(
      numWeekFinish: int.tryParse(finishedWeekController.text),
      isDone: isDone,
    );
    try {
      isLoading.value = true;
      await updateTask(updatedTask);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  showBottomSheet(TaskModel task) {
    RxBool isDone = task.isDone!.obs;
    showModalBottomSheet(
        enableDrag: true,
        showDragHandle: true,
        context: Get.context!,
        builder: (context) {
          return SurfaceContainer(
              child: Column(children: [
            CustomTextFormField.number(
              controller: finishedWeekController,
              validator: (value) => validateEmpty(value),
              labelText: 'Finished Week',
            ),
            Row(
              children: [
                Text('Is task Done ?',
                    style: Theme.of(context).textTheme.bodyMedium),
                Obx(
                  () => Checkbox(
                    value: isDone.value,
                    onChanged: (value) {
                      isDone.value = value ?? false;
                      task = task.copyWith(isDone: value);
                    },
                  ),
                ),
              ],
            ),
            MainButton(
                onPressed: () {
                  updateTaskk(task, isDone.value);
                },
                text: 'Update')
          ]));
        });
  }

  @override
  Future<void> onInit() async {
    try {
      isLoading.value = true;
      tasks = await getTasksByProjectId(2);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }
}
