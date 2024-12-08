import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';

abstract class ForgetPasswordController extends GetxController {
  sendLinkRecovery();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  TextEditingController emailController = TextEditingController();
  @override
  sendLinkRecovery() {
    Routes.otpPage.toPage(
      arguments: emailController.text.toString()
    );
  }
}