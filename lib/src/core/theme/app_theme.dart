import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.backGround,
      primaryColor: AppColors.mainColor,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              color: AppColors.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.textColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: 12,
        ),
        showUnselectedLabels: true,
        elevation: 0,
      ));
}
