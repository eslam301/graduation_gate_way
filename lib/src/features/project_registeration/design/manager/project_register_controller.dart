import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/core/api/models/register_project_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/api_manger.dart';
import '../../../../core/api/models/user.dart';
import '../../data/models/project_model.dart';

abstract class ProjectRegisterController extends GetxController {
  final TextEditingController studentNameController = TextEditingController();
  late final TextEditingController studentIdController;

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
  late User user;

  // Reactive Variables
  final Rx<File> file = File('').obs;

  @override
  void onInit() {
    super.onInit();
    apiManager = Get.find<ApiManager>();
    connection = Get.find<InternetConnectionChecker>();
    user = Get.find<User>();
    studentIdController = TextEditingController(
      text: user.studentId.toString(),
    );

    // Initialize projectModel from arguments if provided
    projectModel =
        Get.arguments != null && Get.arguments.containsKey('projectModel')
            ? (Get.arguments['projectModel'])
            : ProjectModel.empty();

    log('projectModel: $projectModel');

    if (projectModel != ProjectModel.empty()) {
      updateRegisterProjectModelFromRecommended(projectModel: projectModel);
      projectNameController.text = projectModel.name ?? '';
      descriptionController.text = projectModel.description ?? '';
    }
  }

  Future<List<DoctorModel>> getDoctors() async => await apiManager.getDoctors();

  void updateRegisterProjectModelFromRecommended(
      {required ProjectModel projectModel}) {
    registerProjectModel = registerProjectModel.copyWith(
      projectName: projectModel.name ?? '',
      description: projectModel.description ?? '',
      categoryId: projectModel.categoryId ?? 1,
    );
  }

  void addDoctorId(int? doctorId) {
    registerProjectModel = registerProjectModel.copyWith(
      doctorId: doctorId,
    );
  }

  void addProjectData() {
    log('Proposal File Name: ${proposalFileNameController.text}');
    log('Selected File Path: ${file.value.path}');

    registerProjectModel = registerProjectModel.copyWith(
      studentName: studentNameController.text,
      studentId: int.parse(studentIdController.text),
      projectName: projectNameController.text,
      description: descriptionController.text,
      proposalFileName: proposalFileNameController.text,
      categoryId: 1,
    );
  }

  @override
  void submit() async {
    if (await connection.hasConnection) {
      try {
        addProjectData();
        if (file.value.path.isEmpty || !await file.value.exists()) {
          log("Error: File path is empty or file does not exist.");
          Get.snackbar('Error',
              'No file selected or the file does not exist. Please try again.');
          return;
        }

        // Final validation for file length
        try {
          final length = await file.value.length();
          log("File length: $length bytes");
        } catch (e) {
          log("Error reading file length: $e");
          Get.snackbar(
              'Error', 'Failed to read the selected file. Please try again.');
          return;
        }

        registerProjectModel = registerProjectModel.copyWith(
          file: file.value,
        );
        await apiManager.registerProject(registerProjectModel);
        log("Project registration submitted successfully: $registerProjectModel");
      } catch (e) {
        log("Error submitting project details: $e");
        Get.snackbar('Error', 'Failed to submit project details');
      }
    } else {
      Get.snackbar('Error', "No internet connection");
    }
  }

  void selectFile() {
    FilePicker filePicker = FilePicker.platform;
    filePicker.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf']).then((result) {
      if (result != null && result.files.single.path != null) {
        final selectedFile = File(result.files.single.path!);
        if (!selectedFile.existsSync()) {
          log('Error: Selected file does not exist at the specified path.');
          Get.snackbar('Error', 'Selected file not found. Please try again.');
          return;
        }

        try {
          final length = selectedFile.lengthSync();
          log('File selected: ${selectedFile.path}, Size: $length bytes');
          file.value = selectedFile;
          proposalFileNameController.text = result.files.single.name;
          log('File successfully selected: ${file.value.path}');
        } catch (e) {
          log('Error reading selected file: $e');
          Get.snackbar(
              'Error', 'Failed to read the selected file. Please try again.');
        }
      } else {
        log('No file selected');
      }
    }).catchError((error) {
      log('Error picking file: $error');
      Get.snackbar('Error', 'Error picking file: $error');
    });
  }

  @override
  void onClose() {
    studentNameController.dispose();
    studentIdController.dispose();
    super.onClose();
  }
}
