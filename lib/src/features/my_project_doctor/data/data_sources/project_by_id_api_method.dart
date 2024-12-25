import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';

import '../../../project_registeration/data/models/project_model.dart';

Future<List<ProjectModel>> getProjectByDoctorId(int id) {
  ApiManager apiManager = Get.find<ApiManager>();
  return apiManager.getProjectByDoctorId(id);
}
