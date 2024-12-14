import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: fontSize.sp),
      ),
    );
  }
}
