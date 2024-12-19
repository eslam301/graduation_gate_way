import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../../../../core/widgets/components/main_button.dart';
import '../controller/login_controller.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());
    final theme = Theme.of(context);
    const Duration animationDuration = Duration(milliseconds: 400);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        CustomTextFormField.user(
          controller: controller.userNameController,
          labelText: 'User Name',
          hintText: 'User Name',
        ),
        const SizedBox(height: 10),
        CustomTextFormField.password(
          controller: controller.passwordController,
        ),
        const SizedBox(height: 20),
        FadeInUp(
          duration: animationDuration,
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: controller.forgetPassword,
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: animationDuration,
          delay: const Duration(milliseconds: 300),
          child: SizedBox(
            width: 275,
            child: MainButton(
              text: 'Login account',
              onPressed: controller.login,
            ),
          ),
        ),
        FadeInUp(
          duration: animationDuration,
          delay: const Duration(milliseconds: 400),
          child: InkWell(
            onTap: controller.navigateToSignUp,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    'Don\'t have an account?',
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
