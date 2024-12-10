import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../core/api/models/user.dart';
import '../../../core/route/routes_name.dart';

abstract class HomeLayoutController extends GetxController {
  openMyDrawer();
  myProject();
  registerProject();
  projectRecommendation();
}

class HomeLayoutControllerImp extends HomeLayoutController {
  final User user = Get.arguments;
  final scaffoldKey = GlobalKey<ScaffoldState>();



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
    print('projectRecommendation');
    Routes.projectRecommendation.toPage(
      arguments: user,
    );
  }

  @override
  registerProject() {

  }


}
