import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../controller/login_controller.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Hello there, login to continue',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.grey,
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      CustomTextFormField.user(
        controller: controller.userNameController,
        labelText: 'User Name',
        hintText: 'User Name',
      ),
      const SizedBox(
        height: 10,
      ),
      CustomTextFormField.password(
        controller: controller.passwordController,
      ),
      const SizedBox(
        height: 20,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: controller.forgetPassword,
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        width: 275,
        child: MainButton(
          text: 'Login account',
          onPressed: () {
            controller.login();
          },
        ),
      ),
      InkWell(
        onTap: () {
          controller.navigateToSignUp();
        },
        child: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            )),
      )
    ]);
  }
}
