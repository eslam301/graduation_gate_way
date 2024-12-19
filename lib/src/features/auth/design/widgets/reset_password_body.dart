import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/extensions/extensions_on_int.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';

import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Column(
      children: [
        20.hSpace(),
        CustomTextFormField.password(
          labelText: 'Password',
          controller: controller.passwordController,
        ),
        20.hSpace(),
        CustomTextFormField.password(
          labelText: 'Re-enter password',
          controller: controller.confirmPasswordController,
        ),
        20.hSpace(),
        SizedBox(
            width: 275.w,
            child: MainButton(
                onPressed: () {
                  controller.confirmPassword();
                },
                text: 'Confirm Password')),
      ],
    );
  }
}
