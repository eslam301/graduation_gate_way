import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../../../../core/widgets/components/main_button.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Column(
      children: [
        CustomTextFormField.email(
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
