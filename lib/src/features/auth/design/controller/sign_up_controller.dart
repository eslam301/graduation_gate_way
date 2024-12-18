import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/models/student_model.dart';
import '../../../../core/api/models/track_model.dart';
import '../../../../core/route/routes_name.dart';

abstract class SignUpController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countStudentUnitsController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  int? selectedTrackId;

  final connection = Get.find<InternetConnectionChecker>();

  late final ApiManager apiManager;

  createAccount();

  navigateToLogin();
}

class SignUpControllerImp extends SignUpController {
  @override
  void onInit() {
    apiManager = Get.find<ApiManager>();
    super.onInit();
  }

  @override
  createAccount() {
    StudentModel student = StudentModel(
      firstname: firstNameController.text,
      lastname: lastNameController.text,
      studentId: int.parse(studentIdController.text),
      username: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
      trackId: selectedTrackId ?? 1,
      countUnits: int.parse(countStudentUnitsController.text),
    );
    apiManager.signUpStudent(student: student);
    log('Student model ${student.toString()}');
  }

  @override
  navigateToLogin() {
    Routes.login.toPage();
  }

  Future<List<TrackModel>> getTracks() async {
    List<TrackModel> tracks = await apiManager.getTracks();
    log('tracks ${tracks.toString()}');
    return tracks;
  }

  void setSelectedTrackId(int? trackId) {
    selectedTrackId = trackId;
    update();
  }
}
