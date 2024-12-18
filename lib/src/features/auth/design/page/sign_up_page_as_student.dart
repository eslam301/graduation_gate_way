import 'package:flutter/cupertino.dart';
import 'package:graduation_gate_way/src/features/auth/design/layout/auth_layout.dart';

import '../widgets/sign_up_body_as_student.dart';

class SignUpPageAsStudent extends StatelessWidget {
  const SignUpPageAsStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
        title: 'Sign Up as Student', body: SignUpBodyAsStudent());
  }
}
