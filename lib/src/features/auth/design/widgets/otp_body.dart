import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/theme/app_color.dart';
import '../controller/otp_controller.dart';

class OTPBody extends StatelessWidget {
  final String emailText;

  const OTPBody({super.key, this.emailText = ''});

  @override
  Widget build(BuildContext context) {
    OTPControllerImp controller = Get.put(OTPControllerImp());
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Enter recovery code',
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
            'We have sent it on your email $emailText',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Pinput(
          length: 6,
          showCursor: true,
          controller: controller.otpController,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          onCompleted: (value) {},
        ),
        SizedBox(height: 30.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'This code will expire in 5 minutes',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.mainColor,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 275.w,
          child: MainButton(
            onPressed: () {
              controller.confirmCode(
                controller.otpController.text,
              );
            },
            text: 'Confirm Code',
          ),
        ),
      ],
    );
  }
}
