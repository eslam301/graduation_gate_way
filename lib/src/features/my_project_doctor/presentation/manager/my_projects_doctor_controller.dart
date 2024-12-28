import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/project_registeration/data/models/project_model.dart';

import '../../../../core/api/models/user.dart';
import '../../../../core/route/router.dart';
import '../../../../core/route/routes_name.dart';
import '../../data/data_sources/project_by_id_api_method.dart';
import '../pages/my_project_doctor_details_page_view.dart';

class MyProjectDoctorController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  late final List<ProjectModel> projectList;
  User user = Get.find<User>();

  viewDetails({
    project,
  }) {
    getToPage(MyProjectDoctorDetailsPageView(project: project));
  }

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

  tasks() {
    Routes.tasks.toPage();
  }
}
