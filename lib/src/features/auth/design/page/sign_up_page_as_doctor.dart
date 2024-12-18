import 'package:flutter/cupertino.dart';

import '../layout/auth_layout.dart';
import '../widgets/sign_up_body_as_doctor.dart';

class SignUpPageAsDoctor extends StatelessWidget {
  const SignUpPageAsDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
      title: 'Sign Up as Doctor',
      body: SignUpBodyDoctor(),
    );
  }
}
