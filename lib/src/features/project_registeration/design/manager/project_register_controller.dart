import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/core/api/models/register_project_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/api_manger.dart';
import '../../data/models/project_model.dart';

abstract class ProjectRegisterController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;

  final List<TextEditingController> studentNameList =
      List.generate(6, (_) => TextEditingController());
  final List<TextEditingController> studentIdList =
      List.generate(6, (_) => TextEditingController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController proposalFileNameController =
      TextEditingController();

  late final ProjectModel projectModel;

  void nextPage();

  void submit();

  bool isProjectModelEmpty() => projectModel == ProjectModel.empty();
}

class ProjectRegisterControllerImp extends ProjectRegisterController {
  RegisterProjectModel registerProjectModel = RegisterProjectModel.empty();
  late final ApiManager apiManager;
  late InternetConnectionChecker connection;

  @override
  void onInit() {
    super.onInit();
    apiManager = Get.find<ApiManager>();
    connection = Get.find<InternetConnectionChecker>();

    // Initialize projectModel from arguments if provided
    projectModel =
        Get.arguments != null && Get.arguments.containsKey('projectModel')
            ? (Get.arguments['projectModel']?.toProjectModel() ??
                (throw Exception("Invalid ProjectModel data")))
            : ProjectModel.empty();

    log('projectModel: $projectModel');

    if (projectModel != ProjectModel.empty()) {
      updateRegisterProjectModelFromRecommended(projectModel: projectModel);
      nameController.text = projectModel.title ?? '';
      descriptionController.text = projectModel.description ?? '';
    }

    // Update page index reactively on page changes
    pageController.addListener(() {
      final page = pageController.page?.round() ?? 0;
      currentPageIndex(page);
    });
  }

  @override
  void nextPage() {
    if (!isLastPage()) {
      addStudentListId();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<List<DoctorModel>> getDoctors() async => await apiManager.getDoctors();

  void updateRegisterProjectModelFromRecommended(
      {required ProjectModel projectModel}) {
    registerProjectModel = registerProjectModel.copyWith(
      name: projectModel.title ?? '',
      description: projectModel.description ?? '',
      categoryId: 1,
    );
  }

  void addDoctorId(int? doctorId) {
    registerProjectModel = registerProjectModel.copyWith(
      doctorId: doctorId,
    );
  }

  void addStudentListId() {
    final studentIds = studentIdList
        .where((controller) => controller.text.isNotEmpty)
        .map((controller) => int.parse(controller.text))
        .toList();

    registerProjectModel = registerProjectModel.copyWith(
      studentIds: studentIds,
    );
  }

  @override
  void submit() async {
    if (await connection.hasConnection) {
      try {
        await apiManager.registerProject(registerProjectModel);
        log("Project registration submitted successfully: $registerProjectModel");
      } catch (e) {
        log("Error submitting project details: $e");
      }
    } else {
      Get.snackbar('error', "No internet connection");
    }
  }

  bool isLastPage() => currentPageIndex.value == 1;

  @override
  void onClose() {
    pageController.dispose();
    studentNameList.forEach((controller) => controller.dispose());
    studentIdList.forEach((controller) => controller.dispose());
    super.onClose();
  }
}
