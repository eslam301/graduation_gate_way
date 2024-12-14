import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class TextInputField extends StatefulWidget {
  final int? delay;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIconWidget;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  const TextInputField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconWidget,
    this.validator,
    this.textInputType,
    this.delay,
  });

  const TextInputField.email({
    super.key,
    this.controller,
    this.hintText = 'Enter your email',
    this.labelText = 'Email Address',
    this.suffixIcon = Icons.email_outlined,
    this.prefixIcon,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.emailAddress,
    this.delay,
  });

  const TextInputField.user({
    super.key,
    this.controller,
    this.hintText = 'Enter user name',
    this.labelText = 'User Name',
    this.suffixIcon = Icons.person_outline,
    this.prefixIcon,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.name,
    this.delay,
  });

  const TextInputField.name({
    super.key,
    this.controller,
    this.hintText = 'Enter your name',
    this.labelText = 'Name',
    this.suffixIcon = Icons.person_4_outlined,
    this.suffixIconWidget,
    this.prefixIcon,
    this.validator,
    this.textInputType = TextInputType.name,
    this.delay,
  });

  const TextInputField.phone({
    super.key,
    this.controller,
    this.hintText = 'Enter your phone number',
    this.labelText = 'Phone number',
    this.suffixIcon = Icons.call_outlined,
    this.suffixIconWidget,
    this.prefixIcon,
    this.validator,
    this.textInputType = TextInputType.phone,
    this.delay,
  });

  const TextInputField.password({
    super.key,
    this.controller,
    this.hintText = 'Enter your password',
    this.labelText = 'Password',
    this.suffixIcon = Icons.visibility_rounded,
    this.suffixIconWidget,
    this.prefixIcon,
    this.validator,
    this.textInputType = TextInputType.visiblePassword,
    this.delay,
  });

  const TextInputField.confirmPassword({
    super.key,
    this.controller,
    this.hintText = 'Enter your password again',
    this.labelText = 'confirm Password',
    this.suffixIcon = Icons.visibility_rounded,
    this.suffixIconWidget,
    this.prefixIcon,
    this.validator,
    this.textInputType = TextInputType.visiblePassword,
    this.delay,
  });

  @override
  State<TextInputField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<TextInputField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.suffixIcon == Icons.visibility_rounded ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        border: outlineBorder(theme),
        enabledBorder: outlineBorder(theme),
        focusedBorder: outlineBorder(theme),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
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
        color: AppColors.black,
        //fontFamily: fontName2,
        fontSize: 16.sp,
      ),
      validator: widget.validator,
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
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ));
  }
}
