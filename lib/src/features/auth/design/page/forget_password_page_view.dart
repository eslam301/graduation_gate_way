import 'package:flutter/cupertino.dart';
import 'package:graduation_gate_way/src/features/auth/design/layout/auth_layout.dart';

import '../widgets/forget_password_body.dart';

class ForgetPasswordPageView extends StatelessWidget {
  const ForgetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
        appBarTitle: 'Forget Password',
        title: 'Password Recovery',
        subTitle: 'Enter your email address\nto Recover your password',
        body: ForgetPasswordBody());
  }
}
