import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/features/auth/design/layout/auth_layout.dart';

import '../widgets/login_body.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
        appBarTitle: 'Login',
        title: 'Welcome Back',
        subTitle: 'Login to your account',
        body: LoginBody());
  }
}
