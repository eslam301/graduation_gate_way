import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';

import '../../../../core/api/api_manger.dart';
import '../../data/models/project_model.dart';

abstract class ProjectRegisterController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;

  final List<TextEditingController> studentNameList =
      List.generate(6, (_) => TextEditingController());
  final List<TextEditingController> studentIdList =
      List.generate(6, (_) => TextEditingController());

  late final ProjectModel projectModel;

  void nextPage();

  void submit();

  bool isProjectModelEmpty() {
    return projectModel == ProjectModel.empty();
  }
}

class ProjectRegisterControllerImp extends ProjectRegisterController {
  @override
  void onInit() {
    super.onInit();

    // Check if Get.arguments exists and contains the 'projectModel' key
    if (Get.arguments != null && Get.arguments.containsKey('projectModel')) {
      final arguments = Get.arguments;
      projectModel = arguments['projectModel']?.toProjectModel() ??
          (throw Exception("Invalid ProjectModel data"));
    } else {
      // Default to a null projectModel if no arguments are provided
      projectModel = ProjectModel.empty();
    }

    // Set up the page controller listener
    pageController.addListener(() {
      final page = pageController.page?.round() ?? 0;
      currentPageIndex(page); // Update reactive page index
    });
  }

  @override
  void nextPage() {
    if (currentPageIndex.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      log("Project details submitted");
    }
  }

  Future<List<DoctorModel>> getDoctors() async {
    return await Get.find<ApiManager>().getDoctors();
  }

  @override
  void submit() {
    // Add your submit logic here
    log("Submitting project details...");
  }

  bool isLastPage() => currentPageIndex.value == 1;

  @override
  void onClose() {
    pageController.dispose();
    for (var controller in [
      ...studentNameList,
      ...studentIdList,
    ]) {
      controller.dispose();
    }
    super.onClose();
  }
}
