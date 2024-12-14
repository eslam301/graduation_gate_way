import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.grey,
      fontSize: 48.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.grey,
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: AppColors.grey,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontSize: 21.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: AppColors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: AppColors.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  );

  static ColorScheme colorScheme = const ColorScheme.light(
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
      colorScheme: colorScheme,
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.textColor,
        textColor: AppColors.textColor,
        titleTextStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 32),
        elevation: 5,
      ));
}
