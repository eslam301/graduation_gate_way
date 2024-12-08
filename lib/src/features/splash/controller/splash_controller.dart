import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../core/route/routes_name.dart';

abstract class SplashController extends GetxController {
  navigateToLogin();
  navigateToSignUp();
}

class SplashControllerImp extends SplashController {



  @override
  void navigateToLogin() {
    Routes.login.toPage();
  }

  @override
  void navigateToSignUp() {
    Routes.signUp.toPage();
  }


}
