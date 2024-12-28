import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/features/task/data/models/task_model.dart';
import 'package:graduation_gate_way/src/features/task/presentation/widgets/task_item.dart';

import 'tasks_chart.dart';

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
                task: task,
                isFirst: index == 0,
                isLast: index == tasks.length - 1,
              );
            },
          ),
        ),
        const Divider(thickness: 1),
        TasksChart(
          doneSpots: getDoneTask(tasks),
          notDoneSpots: getNotDoneTask(tasks),
        ),
      ],
    );
  }

  List<FlSpot> getDoneTask(List<TaskModel> tasks) {
    List<FlSpot> doneSpots = [];
    for (int index = 0; index < tasks.length; index++) {
      tasks.sort((a, b) => a.numWeekAdd!.compareTo(b.numWeekAdd!));
      TaskModel task = tasks[index];
      if (task.isDone == true) {
        double numWeekAdd = task.numWeekAdd?.toDouble() ?? 0;
        double numWeekFinish = task.numWeekFinish?.toDouble() ?? 0;
        doneSpots.add(FlSpot(numWeekAdd, numWeekFinish));
      }
    }
    log(doneSpots.toString());
    return doneSpots;
  }

  List<FlSpot> getNotDoneTask(List<TaskModel> tasks) {
    List<FlSpot> notDoneSpots = [];
    for (int index = 0; index < tasks.length; index++) {
      tasks.sort((a, b) => a.numWeekAdd!.compareTo(b.numWeekAdd!));
      TaskModel task = tasks[index];

      double numWeekAdd = task.numWeekAdd?.toDouble() ?? 0;
      double numWeekDeadline = task.numWeekDeadline?.toDouble() ?? 0;
      if (true) {
        notDoneSpots.add(FlSpot(numWeekAdd, numWeekDeadline));
      }
    }
    log(notDoneSpots.toString());

    return notDoneSpots;
  }
}
