import 'package:flutter/cupertino.dart';
import 'package:graduation_gate_way/src/features/auth/design/layout/auth_layout.dart';

import '../widgets/reset_password_body.dart';

class ResetPasswordPageView extends StatelessWidget {
  const ResetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(title: 'Reset Password', body: ResetPasswordBody());
  }
}
