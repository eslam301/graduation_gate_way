import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/features/task/data/models/task_model.dart';
import 'package:graduation_gate_way/src/features/task/presentation/widgets/task_item.dart';

import '../../../my_project_doctor/presentation/widgets/tasks_chart.dart';

class TasksBody extends StatelessWidget {
  final List<TaskModel> tasks;

  const TasksBody({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Weekly Completed Task',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Divider(thickness: 1),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskItem(
                title: task.title,
                subtitle: task.description,
                isDone: task.isDone,
                date: task.date,
                isFirst: index == 0,
                isLast: index == tasks.length - 1,
              );
            },
          ),
        ),
        const Divider(thickness: 1),
        const TasksChart(),
      ],
    );
  }
}
