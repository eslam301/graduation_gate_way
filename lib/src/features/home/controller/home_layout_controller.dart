import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../core/api/models/user.dart';
import '../../../core/route/routes_name.dart';
import '../../../core/utils/shared_pref.dart';

abstract class HomeLayoutController extends GetxController {
  openMyDrawer();

  myProject();

  registerProject();

  projectRecommendation();
}

class HomeLayoutControllerImp extends HomeLayoutController {
  late User user;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final RxBool isLoading = false.obs; // Reactive variable

  @override
  void onInit() {
    super.onInit();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    isLoading.value = true; // Update only reactive variable
    try {
      user = await SharedPref.getUserData();
      log("User loaded successfully: ${user.toString()}");
      Get.put(user);
    } catch (e) {
      log("Error initializing user: $e");
      user = User(); // Fallback to an empty User object
    } finally {
      isLoading.value = false;
    }
  }

  @override
  openMyDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    // No unnecessary call to `update()`
  }

  @override
  myProject() {
    // Implement logic here
    Routes.myProject.toPage();
  }

  @override
  projectRecommendation() {
    Routes.projectRecommendationTest.toPage();
  }

  @override
  registerProject() {
    Routes.projectRegistration.toPage();
  }
}
