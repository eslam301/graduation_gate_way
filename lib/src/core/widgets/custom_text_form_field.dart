import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final int? delay;

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.suffixIconWidget,
    this.validator,
    this.textInputType, this.delay,
  });
  const CustomTextFormField.email({
    super.key,
    this.controller,
    this.hintText = 'Enter your email',
    this.labelText = 'Email Address',
    this.suffixIcon = Icons.email_outlined,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.emailAddress, this.delay,
  });
  const CustomTextFormField.user({
    super.key,
    this.controller,
    this.hintText = 'Enter user name',
    this.labelText = 'User Name',
    this.suffixIcon = Icons.person_outline,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.name, this.delay,
  });
  const CustomTextFormField.name({
    super.key,
    this.controller,
    this.hintText = 'Enter your name',
    this.labelText = 'Name',
    this.suffixIcon = Icons.person_4_outlined,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.name, this.delay,
  });
  const CustomTextFormField.phone({
    super.key,
    this.controller,
    this.hintText = 'Enter your phone number',
    this.labelText = 'Phone number',
    this.suffixIcon = Icons.call_outlined,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.phone, this.delay,
  });
  const CustomTextFormField.password({
    super.key,
    this.controller,
    this.hintText = 'Enter your password',
    this.labelText = 'Password',
    this.suffixIcon = Icons.visibility_rounded,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.visiblePassword, this.delay,
  });
  const CustomTextFormField.confirmPassword({
    super.key,
    this.controller,
    this.hintText = 'Enter your password again',
    this.labelText = 'confirm Password',
    this.suffixIcon = Icons.visibility_rounded,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.visiblePassword, this.delay,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;
  @override
  void initState() {
    obscureText = widget.suffixIcon == Icons.visibility_rounded ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FadeInLeft(
      duration: const Duration(milliseconds: 400),
      delay: Duration(milliseconds: widget.delay ?? 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.labelText!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                border: outlineBorder(theme),
                enabledBorder: outlineBorder(theme),
                focusedBorder: outlineBorder(theme),
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon != Icons.visibility_rounded
                    ? Icon(
                        widget.suffixIcon,
                        color: theme.primaryColor,
                        size: 20,
                      )
                    : obscureTextWidget(theme),
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  //fontFamily: fontName1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                //lapel
                //labelText: widget.labelText,
                // labelStyle: TextStyle(
                //   color: theme.primaryColor,
                //   //fontFamily: fontName2,
                //   fontSize: 14.sp,
                //   fontWeight: FontWeight.w800,
                // ),
              ),
              obscureText: obscureText,
              obscuringCharacter: '*',
              style: TextStyle(
                color: AppColors.grey,
                //fontFamily: fontName2,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
              validator: widget.validator,
            ),
          ],
        ),
      ),
    );
  }

  Widget obscureTextWidget(theme) {
    return IconButton(
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      icon: Icon(
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        size: 24,
        color: theme.primaryColor,
      ),
    );
  }

  OutlineInputBorder outlineBorder(theme) {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ));
  }
}
