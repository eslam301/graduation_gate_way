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
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController numWeekAddedController = TextEditingController();
  TextEditingController numWeekDeadLineController = TextEditingController();

  late List<TaskModel> tasks = [];
  final projectId =
      Get.arguments['projectId'] ?? ''; // Ensure a default value to avoid null
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  updateTaskk(TaskModel task, bool isDone) async {
    //print("task is ${task.toString()}");

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
                  Get.back(); // Close the BottomSheet after updating
                },
                text: 'Update')
          ]));
        });
  }

  @override
  Future<void> onInit() async {
    try {
      isLoading.value = true;
      tasks = await getTasksByProjectId(projectId);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

  void addTask() {
    postTask(TaskModel(
      projectId: projectId,
      title: taskTitleController.text,
      description: taskDescriptionController.text,
      numWeekAdd: int.tryParse(numWeekAddedController.text),
      numWeekDeadline: int.tryParse(numWeekDeadLineController.text),
    ));
  }

  void openAddTaskSheet() {
    showModalBottomSheet(
        enableDrag: true,
        showDragHandle: true,
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return SurfaceContainer(
            child: Column(children: [
              CustomTextFormField(
                controller: taskTitleController,
                validator: (value) => validateEmpty(value),
                labelText: 'title',
                suffixIcon: Icons.title,
              ),
              CustomTextFormField.number(
                controller: numWeekAddedController,
                validator: (value) => validateEmpty(value),
                labelText: 'week added',
              ),
              CustomTextFormField.number(
                controller: numWeekDeadLineController,
                validator: (value) => validateEmpty(value),
                labelText: 'week deadline',
              ),
              CustomTextFormField(
                controller: taskDescriptionController,
                textInputType: TextInputType.multiline,
                validator: (value) => validateEmpty(value),
                labelText: 'Description',
                maxLines: 5,
              ),
              MainButton(
                  onPressed: () {
                    addTask();
                    Get.back(); // Close the BottomSheet after adding
                  },
                  text: 'Add')
            ]),
          );
        });
  }
}
