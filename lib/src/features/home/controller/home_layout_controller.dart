import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/api/models/user.dart';

abstract class HomeLayoutController extends GetxController {
  openMyDrawer();
}

class HomeLayoutControllerImp extends HomeLayoutController {
  final User user = Get.arguments;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  openMyDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    update();
  }
}
