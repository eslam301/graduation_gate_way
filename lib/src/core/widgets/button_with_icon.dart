import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final IconAlignment iconAlignment;
  const ButtonWithIcon({
    super.key,
    this.text = 'Button',
    this.icon = Icons.add,
    this.onPressed,
    this.iconAlignment = IconAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.mainColor),
        minimumSize: WidgetStateProperty.all(Size(230.w, 50)),
        maximumSize: WidgetStateProperty.all(Size(230.w, 50)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
      iconAlignment: iconAlignment,
      icon: Icon(icon),

      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
