import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 48.sp,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.sp,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
    ),
    headlineSmall: TextStyle(
      fontSize: 21.sp,
    ),
    titleLarge: TextStyle(
      fontSize: 24.sp,
    ),
    titleMedium: TextStyle(
      fontSize: 21.sp,
    ),
    titleSmall: TextStyle(
      fontSize: 18.sp,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.sp,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
    ),
  );

  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.mainColor,
      scaffoldBackgroundColor: AppColors.scaffold,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.onSurface,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.onSurface)),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.mainColor,
        onPrimary: AppColors.white,
        secondary: AppColors.mainColorShaded,
        onSecondary: AppColors.black,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceTint: AppColors.surfaceTint(),
      ),
      textTheme: textTheme,
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.onSurface,
        textColor: AppColors.onSurface,
        titleTextStyle: TextStyle(
          color: AppColors.onSurface,
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

  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.mainColor,
      scaffoldBackgroundColor: AppColors.darkScaffold,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.darkOnSurface,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.darkOnSurface)),
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.mainColor,
        onPrimary: AppColors.white,
        secondary: AppColors.mainColorShaded,
        onSecondary: AppColors.black,
        surface: AppColors.darkSurface,
        onSurfaceVariant: AppColors.darkSurface,
        onSurface: AppColors.darkOnSurface,
        surfaceTint: AppColors.darkSurfaceTint(),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.darkOnSurface,
        textColor: AppColors.darkOnSurface,
        titleTextStyle: TextStyle(
          color: AppColors.darkOnSurface,
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
