import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/features/auth/design/widgets/terms_widget.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../controller/sign_up_controller.dart';

class SignUpBodyDoctor extends StatelessWidget {
  const SignUpBodyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.find<SignUpControllerImp>();
    const Duration animationDuration = Duration(milliseconds: 400);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          FadeInLeft(
            duration: animationDuration,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          FadeInLeft(
            duration: animationDuration,
            delay: const Duration(milliseconds: 100),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create an account to continue',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                )),
          ),
          const CustomTextFormField.name(labelText: 'first Name'),
          const CustomTextFormField.name(labelText: 'last Name'),
          const CustomTextFormField.user(),
          const CustomTextFormField.email(
            labelText: 'Email Address',
          ),
          const CustomTextFormField.phone(),
          const CustomTextFormField.password(),
          const CustomTextFormField.confirmPassword(),
          const TermsAndPrivacyCheckbox(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 275,
            child: MainButton(
                text: 'Create account',
                onPressed: () {
                  controller.createAccount();
                }),
          ),
          Column(
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.navigateToLogin();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lighterMainColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
