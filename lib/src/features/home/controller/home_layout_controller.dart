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
  late User
      user; // Use `late` for non-nullable initialization after async fetch
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    isLoading = true;
    log("Initializing user...");
    try {
      user = await SharedPref.getUserData();
      log("User loaded successfully: ${user.toJson()}");
    } catch (e) {
      log("Error initializing user: $e");
      user = User(); // Fallback to an empty User object
    } finally {
      log("User initialization completed.");
      isLoading = false;
    }
    update(); // Notify the UI about changes
  }

  @override
  openMyDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    update();
  }

  @override
  myProject() {
    // TODO: implement myProject
    throw UnimplementedError();
  }

  @override
  projectRecommendation() {
    Routes.projectRecommendationTest.toPage(
      arguments: user,
    );
  }

  @override
  registerProject() {
    // TODO: implement registerProject
  }
}
