import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../layout/auth_layout.dart';
import '../widgets/sign_up_body.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
        title: 'Sign Up',
        body: SignUpBody(),
    );

  }
}
