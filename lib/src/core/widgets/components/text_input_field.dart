import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

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
  final double? radius;

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
    this.radius,
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
    this.radius,
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
    this.radius,
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
    this.radius,
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
    this.radius,
  });

  const TextInputField.number({
    super.key,
    this.controller,
    this.hintText = 'number',
    this.labelText = 'number',
    this.suffixIcon = Icons.numbers,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.number,
    this.delay,
    this.prefixIcon,
    this.radius,
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
    this.radius,
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
    this.radius,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: outlineBorder(theme, radius: widget.radius),
          enabledBorder: outlineBorder(theme, radius: widget.radius),
          focusedBorder: outlineBorder(theme, radius: widget.radius),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon != Icons.visibility_rounded
              ? Icon(
                  widget.suffixIcon,
                  color: theme.primaryColor,
                  size: 16,
                )
              : obscureTextWidget(theme),
          hintStyle: const TextStyle(
            color: AppColors.grey,
            //fontFamily: fontName1,
            fontSize: 14,
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
        style: const TextStyle(
          color: AppColors.black,
          //fontFamily: fontName2,
          fontSize: 14,
        ),
        validator: widget.validator,
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

  OutlineInputBorder outlineBorder(theme, {double? radius}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 15.0)),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ));
  }
}
