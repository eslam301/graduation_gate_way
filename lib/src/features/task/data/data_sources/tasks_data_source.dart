import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/task/data/models/task_model.dart';

import '../../../../core/api/api_manger.dart';

Future<List<TaskModel>> getTasksByProjectId(int projectId) {
  ApiManager apiManager = Get.find<ApiManager>();
  return apiManager.getTasksByProjectId(projectId);
}
