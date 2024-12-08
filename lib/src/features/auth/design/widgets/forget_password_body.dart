import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password Recovery',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 260.w,
              child: Text(
                'We will send password recovery code on this email',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            )),
        CustomTextFormField(
          labelText: 'Email Address',
          controller: controller.emailController,
        ),
        SizedBox(
          height: 60.h,
        ),
        SizedBox(
          width: 275.w,
          child: MainButton(
            onPressed: () {
              controller.sendLinkRecovery();
            },
            text: 'Send Link Recovery',
          ),
        ),
      ],
    );
  }
}
