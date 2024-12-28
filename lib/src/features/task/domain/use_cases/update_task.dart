import 'package:get/get.dart';

import '../../../../core/api/api_manger.dart';
import '../../data/models/task_model.dart';

Future<bool> updateTask(TaskModel task) {
  ApiManager apiManager = Get.find<ApiManager>();
  return apiManager.updateTask(task);
}
