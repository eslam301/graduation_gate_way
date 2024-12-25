import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/project_registeration/data/models/project_model.dart';

import '../../../../core/api/models/user.dart';
import '../../data/data_sources/project_by_id_api_method.dart';

class MyProjectDoctorController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  late final List<ProjectModel> projectList;
  User user = Get.find<User>();

  @override
  void onInit() async {
    try {
      isLoading.value = true;
      projectList = await getProjectByDoctorId(user.id ?? 1);
    } catch (e) {
      log(e.toString());
      errorMessage.value = "no project found ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }
}
