import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class TermsAndPrivacyCheckbox extends StatefulWidget {
  const TermsAndPrivacyCheckbox({super.key});

  @override
  TermsAndPrivacyCheckboxState createState() =>
      TermsAndPrivacyCheckboxState();
}

class TermsAndPrivacyCheckboxState extends State<TermsAndPrivacyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: AppColors.textColor, fontSize: 16.sp),
              children: [
                const TextSpan(text: "I agree to platform’s "),
                TextSpan(
                  text: "Terms of Service",
                  style: const TextStyle(
                      color: AppColors.lighterMainColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle Terms of Service tap
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Terms of Service clicked")),
                      );
                    },
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: const TextStyle(
                      color: AppColors.lighterMainColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle Privacy Policy tap
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Privacy Policy clicked")),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
