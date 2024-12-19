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
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          CustomTextFormField.name(
            labelText: 'first Name',
            controller: controller.firstNameController,
          ),
          CustomTextFormField.name(
            labelText: 'last Name',
            controller: controller.lastNameController,
          ),
          CustomTextFormField.user(
            controller: controller.userNameController,
          ),
          CustomTextFormField.email(
            labelText: 'Email Address',
            controller: controller.emailController,
          ),
          CustomTextFormField.phone(
            controller: controller.phoneNumberController,
          ),
          CustomTextFormField.password(
            controller: controller.passwordController,
          ),
          CustomTextFormField.confirmPassword(
            controller: controller.confirmPasswordController,
          ),
          const TermsAndPrivacyCheckbox(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 275,
            child: MainButton(
                text: 'Create account',
                onPressed: () {
                  controller.createDoctorAccount();
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
