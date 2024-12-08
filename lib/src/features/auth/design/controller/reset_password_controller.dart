import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';

abstract class ResetPasswordController extends GetxController {
  confirmPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  confirmPassword() {
    Routes.login.offAllPage();
  }
}