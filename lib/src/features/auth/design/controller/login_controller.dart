import 'package:flutter/cupertino.dart';
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

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    connection = InternetConnectionChecker();
    super.onInit();
  }

  @override
  void login() async {
    if (await connection.hasConnection) {
      User user = await ApiManger.login(
          //userName: userNameController.text, password: passwordController.text
          );
      Routes.home.offAllPage(
        arguments: user,
      );
    } else {
      Get.snackbar('No Internet', 'Please check your internet connection');
    }
    //Routes.onBoarding.offAllPage();
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
