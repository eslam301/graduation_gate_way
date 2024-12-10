import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/models/user.dart';
import '../../../../core/route/routes_name.dart';

abstract class LoginController extends GetxController {
  void login();
  void forgetPassword();
  void navigateToSignUp();
}

class LoginControllerImp extends LoginController {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late InternetConnectionChecker connection;

  var loading = false.obs; // Reactive loading state

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    connection = InternetConnectionChecker();
    super.onInit();
  }

  @override
  void login() async {
    loading.value = true; // Show loading animation

    if (await connection.hasConnection) {
      try {
        User user = await ApiManger.login(
          // Uncomment these parameters when implementing
          // userName: userNameController.text,
          // password: passwordController.text,
        );
        if (kDebugMode) {
          print('---------------------------------------');
          print(User.userToString(user));
          print('---------------------------------------');
        }


        // Navigate to the home page
        Routes.home.offAllPage(arguments: user);
      } catch (e) {
        Get.snackbar('Error', 'Login failed: $e');
      } finally {
        loading.value = false; // Hide loading animation
      }
    } else {
      loading.value = false; // Hide loading animation
      Get.snackbar('No Internet', 'Please check your internet connection');
    }
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
