import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/main_button.dart';
import 'package:graduation_gate_way/src/features/auth/design/widgets/terms_widget.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../controller/sign_up_controller.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hello',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Create an account to continue',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
            )),
        const CustomTextFormFiled(text: 'Your Name'),
        const CustomTextFormFiled(text: 'Email Address'),
        const CustomTextFormFiled.password(),
        const TermsAndPrivacyCheckbox(),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: 275.w,
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
    );
  }
}
