import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/task/data/models/task_model.dart';
import 'package:graduation_gate_way/src/features/task/presentation/manager/task_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskItem extends GetView<TaskController> {
  final TaskModel task;
  final bool isLast;
  final bool isFirst;

  const TaskItem({
    super.key,
    required this.isLast,
    required this.isFirst,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final bool taskIsDone = task.isDone ?? false;
    return GestureDetector(
      onTap: () {
        controller.showBottomSheet(task);
      },
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
            width: 30,
            color: taskIsDone ? Colors.green : Colors.grey,
            indicator: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: taskIsDone ? Colors.green : Colors.grey,
                ),
                child: taskIsDone
                    ? const Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.white,
                      )
                    : null)),
        beforeLineStyle: LineStyle(
          color: taskIsDone ? Colors.green : Colors.grey,
          thickness: 2,
        ),
        endChild: ListTile(
          title: Text(task.title ?? ''),
          subtitle: Text(task.description ?? ''),
          leading: Text("Added ${task.numWeekAdd.toString()}"),
          trailing: Text("Deadline ${task.numWeekDeadline.toString()}"),
        ),
      ),
    );
  }
}
