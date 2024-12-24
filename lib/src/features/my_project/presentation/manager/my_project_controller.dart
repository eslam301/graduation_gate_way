import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/core/api/models/my_project_model.dart';

import '../../../../core/api/models/user.dart';

class MyProjectController extends GetxController {
  Rx<MyProjectModel?> myProject = Rx<MyProjectModel?>(null);
  late final ApiManager apiManager;
  late final User user;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  Future<void> onInit() async {
    try {
      apiManager = Get.find<ApiManager>();
      user = Get.find<User>();
      final int? projectId = user.projectId;

      if (projectId == null || projectId <= 0) {
        throw Exception("Invalid project ID: $projectId");
      }

      getMyProjectById(projectId ?? 1);
    } catch (e) {
      log("Initialization error: $e");
      errorMessage.value = "no project found";
    } finally {
      isLoading.value = false;
    }

    super.onInit();
  }

  Future<void> getMyProjectById(int id) async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset error message before fetching.
    try {
      myProject.value = await apiManager.getMyProjectById(id);
    } catch (e) {
      log('Failed to fetch project: $e');
      errorMessage.value =
          'Could not fetch the project. Please try again later.';
    } finally {
      isLoading.value = false;
    }
  }
}
