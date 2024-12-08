import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../core/route/routes_name.dart';

abstract class OnSplashController extends GetxController {
  Future<void> navigateToSplash();
}

class OnSplashControllerImp extends OnSplashController {

  @override
  Future<void> navigateToSplash() async {
    Routes.splash.toPage();
  }
}