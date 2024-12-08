import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomTextFormField extends StatefulWidget {
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
    this.textInputType,
  });
  const CustomTextFormField.email({
    super.key,
    this.controller,
    this.hintText = 'Enter your email',
    this.labelText = 'Email Address',
    this.suffixIcon = Icons.email_outlined,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.emailAddress,
  });

  const CustomTextFormField.user({
    super.key,
    this.controller,
    this.hintText = 'Enter your Real name',
    this.labelText = 'Name',
    this.suffixIcon = Icons.person_outline,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.name,
  });
  const CustomTextFormField.phone({
    super.key,
    this.controller,
    this.hintText = 'Enter your phone number',
    this.labelText = 'Phone number',
    this.suffixIcon = Icons.call_outlined,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.phone,
  });
  const CustomTextFormField.password({
    super.key,
    this.controller,
    this.hintText = 'Enter your password',
    this.labelText = 'Password',
    this.suffixIcon = Icons.visibility_rounded,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.visiblePassword,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText!,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
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
                fontWeight: FontWeight.w800,
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
