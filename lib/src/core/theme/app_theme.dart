import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.white,
      fontSize: 48.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.white,
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: AppColors.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: AppColors.grey,
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: AppColors.grey,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.grey,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
  );

  static ColorScheme colorScheme = ColorScheme.light(
    primary: AppColors.mainColor,
    secondary: AppColors.mainColor,
    onPrimary: AppColors.backGround,
    onSecondary: AppColors.backGround,
  );

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.backGround,
      primaryColor: AppColors.mainColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.textColor)),
      textTheme: textTheme,

      colorScheme:colorScheme,

      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.textColor,
        textColor: AppColors.textColor,
        titleTextStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
        ),
      ),
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
