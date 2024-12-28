import 'package:flutter/material.dart';

import '../manager/task_controller.dart';

class AddTaskButton extends StatelessWidget {
  final TaskController controller;

  const AddTaskButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.openAddTaskSheet();
        });
  }
}
