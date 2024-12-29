import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/project_registeration/data/models/project_model.dart';

import '../../../../core/api/api_manger.dart';

Future<List<ProjectModel>> getProjectByDrId(int id) async {
  ApiManager apiManager = Get.find<ApiManager>();
  return apiManager.getProjectByDoctorId(id);
}
