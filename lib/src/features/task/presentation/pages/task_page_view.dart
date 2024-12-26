import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';
import 'package:graduation_gate_way/src/features/task/data/models/task_model.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../widgets/task_body.dart';

class TaskPageView extends StatelessWidget {
  const TaskPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(title: 'tasks'),
      body: TasksBody(
        tasks: [
          TaskModel(
              id: 1,
              isDone: true,
              title: 'UI design task  ',
              description: 'For website and app project',
              date: DateTime.now()),
          TaskModel(
              id: 2,
              isDone: false,
              title: 'UI design task  ',
              description: 'For website and app project',
              date: DateTime.now()),
          TaskModel(
              id: 2,
              isDone: true,
              title: 'UI design task  ',
              description: 'For website and app project',
              date: DateTime.now()),
          TaskModel(
              id: 2,
              isDone: false,
              title: 'UI design task  ',
              description: 'For website and app project',
              date: DateTime.now()),
        ],
      ),
    );
  }
}
