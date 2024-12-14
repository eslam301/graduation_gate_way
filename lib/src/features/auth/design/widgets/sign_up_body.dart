import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/features/auth/design/widgets/terms_widget.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/custom_drop_down_item_bar.dart';
import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../controller/sign_up_controller.dart';

class SignUpBodyDoctor extends StatelessWidget {
  const SignUpBodyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
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
          const CustomTextFormField.name(labelText: 'first Name', delay: 200),
          const CustomTextFormField.name(labelText: 'last Name', delay: 300),
          const CustomTextFormField.user(delay: 400),
          const CustomTextFormField.email(
              labelText: 'Email Address', delay: 500),
          const CustomTextFormField.phone(delay: 600),
          const CustomTextFormField.password(delay: 700),
          const CustomTextFormField.confirmPassword(delay: 800),
          CustomDropDownItemBar(
            hintText: 'Your Track',
            dropItems: [
              DropItemModel(
                title: 'Flutter',
                value: 'Fl',
              ),
              DropItemModel(
                title: 'AI',
                value: 'Ai',
              ),
              DropItemModel(
                title: 'Machine Learning',
                value: 'Ml',
              ),
              DropItemModel(
                title: 'Android',
                value: 'And',
              ),
              DropItemModel(
                title: 'IOS',
                value: 'Ios',
              ),
              DropItemModel(
                title: 'Web',
                value: 'Web',
              ),
            ],
          ),
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
      ),
    );
  }
}
