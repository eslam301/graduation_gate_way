import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';

abstract class OTPController extends GetxController{
  confirmCode(String code);
}

class OTPControllerImp extends OTPController{
  TextEditingController otpController = TextEditingController();
  @override
  confirmCode(String code) {
    Routes.resetPassword.toPage();
  }
}