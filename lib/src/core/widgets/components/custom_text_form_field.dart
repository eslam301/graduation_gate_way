import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final double radius;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Color? borderColor;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.borderColor = Colors.transparent,
    this.radius = 15,
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
    this.radius = 15,
    this.borderColor = Colors.transparent,
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
    this.radius = 15,
    this.hintText = 'Enter user name',
    this.labelText = 'User Name',
    this.suffixIcon = Icons.person_outline,
    this.borderColor = Colors.transparent,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.name,
  });

  const CustomTextFormField.name({
    super.key,
    this.controller,
    this.radius = 15,
    this.hintText = 'Enter your name',
    this.labelText = 'Name',
    this.suffixIcon = Icons.person_4_outlined,
    this.borderColor = Colors.transparent,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.name,
  });

  const CustomTextFormField.phone({
    super.key,
    this.controller,
    this.hintText = 'Enter your phone number',
    this.radius = 15,
    this.labelText = 'Phone number',
    this.suffixIcon = Icons.call_outlined,
    this.borderColor = Colors.transparent,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.phone,
  });

  const CustomTextFormField.number({
    super.key,
    this.controller,
    this.radius = 15,
    this.hintText = 'number',
    this.labelText = 'number',
    this.suffixIcon = Icons.perm_identity,
    this.borderColor = Colors.transparent,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.number,
  });

  const CustomTextFormField.password({
    super.key,
    this.controller,
    this.radius = 15,
    this.hintText = 'Enter your password',
    this.labelText = 'Password',
    this.suffixIcon = Icons.visibility_rounded,
    this.borderColor = Colors.transparent,
    this.suffixIconWidget,
    this.validator,
    this.textInputType = TextInputType.visiblePassword,
  });

  const CustomTextFormField.confirmPassword({
    super.key,
    this.controller,
    this.radius = 15,
    this.hintText = 'Enter your password again',
    this.borderColor = Colors.transparent,
    this.labelText = 'confirm Password',
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
          Text(widget.labelText!,
              style: theme.textTheme.bodyMedium?.copyWith()),
          SizedBox(height: 8.h),
          TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(value);
              }
              return null;
            },
            keyboardType: widget.textInputType,
            maxLines: widget.suffixIcon != null ? 1 : 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.surfaceTint,
              border: outlineBorder(theme,
                  color: widget.borderColor, radius: widget.radius),
              enabledBorder: outlineBorder(theme,
                  color: widget.borderColor, radius: widget.radius),
              focusedBorder: outlineBorder(theme,
                  color: widget.borderColor, radius: widget.radius),
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

  OutlineInputBorder outlineBorder(theme, {double radius = 12, Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: color ?? Colors.transparent,
          width: 1.0,
        ));
  }
}
