import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';

abstract class SignUpController extends GetxController {
  createAccount();
  navigateToLogin();
}

class SignUpControllerImp extends SignUpController {
  @override
  createAccount() {}

  @override
  navigateToLogin() {
    Routes.login.toPage();
  }
}