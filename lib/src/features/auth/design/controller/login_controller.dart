import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';

abstract class LoginController extends GetxController {
  void login();
  void forgetPassword();
  void navigateToSignUp();
}

class LoginControllerImp extends LoginController {
  @override
  void login() {
    Routes.onBoarding.offAllPage();
  }

  @override
  void forgetPassword() {
    Routes.forgetPassword.toPage();
  }

  @override
  void navigateToSignUp() {
    Routes.signUp.toPage();
  }
}