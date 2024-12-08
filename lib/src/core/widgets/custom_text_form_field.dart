import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String text;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController? controller;
  const CustomTextFormFiled({
    super.key,
    this.controller,
    required this.text,
    this.icon,
    this.isPassword = false,
  });
  const CustomTextFormFiled.password({
    super.key,
    this.text = 'Password',
    this.controller,
    this.icon = Icons.remove_red_eye_outlined,
    this.isPassword = true,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isRight = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide.none,
            ),
            suffixIcon:suffixIcon(
              icon: widget.icon,
            ),

            // suffix: IconButton(
            //   icon: const Icon(
            //     Icons.remove_red_eye,
            //     color: AppColors.grey,
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       isRight = !isRight;
            //     });
            //   },
            // )
          ),
          // obscureText: isPassword == true ? isObscure : isObscure,
        ),
      ],
    );
  }

  Widget suffixIcon({IconData? icon}) {
    return Visibility(
      visible: true,
      child: Icon(
        icon ?? Icons.check_circle,
        size: 30,
        color: icon == null? AppColors.right : AppColors.grey,
      ),
    );
  }
}
