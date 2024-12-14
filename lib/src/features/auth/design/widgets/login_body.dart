import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../../../../core/widgets/components/main_button.dart';
import '../controller/login_controller.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());
    final textTheme = Theme.of(context).textTheme;
    const Duration animationDuration = Duration(milliseconds: 400);
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInLeft(
              duration: animationDuration,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome back!',
                  style: textTheme.titleMedium,
                ),
              ),
            ),
            FadeInLeft(
              duration: animationDuration,
              delay: const Duration(milliseconds: 100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello there, login to continue',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField.user(
              controller: controller.userNameController,
              delay: 200,
              labelText: 'User Name',
              hintText: 'User Name',
            ),
            const SizedBox(height: 10),
            CustomTextFormField.password(
              delay: 300,
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
                      color: AppColors.black,
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
                  ),
                ),
              ),
            ),
          ],
        ).loadable(isLoading: controller.loading.value));
  }
}
