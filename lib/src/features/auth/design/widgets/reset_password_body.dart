import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/extensions/extensions_on_int.dart';
import 'package:graduation_gate_way/src/core/widgets/main_button.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = ResetPasswordControllerImp();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'New password',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Please inter your password',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
        ),
        30.hSpace(),
        CustomTextFormFiled.password(
          text: 'Password',
          controller: controller.passwordController,
        ),
        30.hSpace(),
        CustomTextFormFiled.password(
          text: 'Re-enter password',
          controller: controller.confirmPasswordController,
        ),
        30.hSpace(),
        SizedBox(
            width: 275.w,
            child: MainButton(onPressed: (){
              controller.confirmPassword();
            }, text: 'Confirm Password')),
      ],
    );
  }
}
