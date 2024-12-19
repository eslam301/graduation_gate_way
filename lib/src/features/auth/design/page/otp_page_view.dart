import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/auth/design/layout/auth_layout.dart';

import '../widgets/otp_body.dart';

class OTPPageView extends StatelessWidget {
  const OTPPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments.toString();
    return AuthLayout(
        appBarTitle: 'OTP',
        title: 'Enter recovery code',
        subTitle: 'We have sent it on your\n $email',
        body: const OTPBody());
  }
}
