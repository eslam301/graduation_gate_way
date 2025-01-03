import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/utils/shared_pref.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/models/user.dart';
import '../../../../core/route/routes_name.dart';

abstract class LoginController extends GetxController {
  void login();

  void forgetPassword();

  void navigateToSignUp();
}

class LoginControllerImp extends LoginController {
  late final formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late InternetConnectionChecker connection;

  final ApiManager apiManger = Get.find<ApiManager>();

  var loading = false.obs; // Reactive loading state

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    connection = Get.find<InternetConnectionChecker>();
    super.onInit();
  }

  @override
  void login() async {
    // Get.context!.loadable(isLoading: loading.value);
    if (formKey.currentState!.validate()) {
      if (await connection.hasConnection) {
        loading.value = true; // Show loading animation
        try {
          User user = await apiManger.login(
            userName: userNameController.text.isEmpty
                ? null
                : userNameController.text,
            password: passwordController.text.isEmpty
                ? null
                : passwordController.text,
          );
          await SharedPref.saveUserData(user);
          await SharedPref.saveUserId(user.id.toString());
          Routes.onBoarding.offAllPage();
          Get.put(user, permanent: true);
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
