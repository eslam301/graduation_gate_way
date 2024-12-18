import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/core/api/models/register_project_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/api_manger.dart';
import '../../data/models/project_model.dart';

abstract class ProjectRegisterController extends GetxController {
  final RxInt currentPageIndex = 0.obs;

  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController proposalFileNameController =
      TextEditingController();

  late final ProjectModel projectModel;

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
      projectNameController.text = projectModel.title ?? '';
      descriptionController.text = projectModel.description ?? '';
    }
  }

  Future<List<DoctorModel>> getDoctors() async => await apiManager.getDoctors();

  void updateRegisterProjectModelFromRecommended(
      {required ProjectModel projectModel}) {
    registerProjectModel = registerProjectModel.copyWith(
      projectName: projectModel.title ?? '',
      description: projectModel.description ?? '',
      categoryId: 0,
    );
  }

  void addDoctorId(int? doctorId) {
    registerProjectModel = registerProjectModel.copyWith(
      doctorId: doctorId,
    );
  }

  void addProjectData() {
    registerProjectModel = registerProjectModel.copyWith(
      studentName: studentNameController.text,
      studentId: int.parse(studentIdController.text),
      projectName: projectNameController.text,
      description: descriptionController.text,
    );
  }

  @override
  void submit() async {
    if (await connection.hasConnection) {
      try {
        addProjectData();
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
    studentNameController.dispose();
    studentIdController.dispose();
    super.onClose();
  }
}
