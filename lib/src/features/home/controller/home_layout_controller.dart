import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeLayoutController extends GetxController {
  openMyDrawer();
}
class HomeLayoutControllerImp extends HomeLayoutController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  openMyDrawer() {
    print('open my drawer');
    scaffoldKey.currentState?.openEndDrawer();
    update();
  }
}