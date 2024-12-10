import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../theme/app_color.dart';

PreferredSize generalAppBar(String? userName) {
  return PreferredSize(
    preferredSize: Size.fromHeight(130.h),
    child: Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          )
      ),
      child: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white , size: 30),
        backgroundColor: Colors.transparent,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Hi, ${userName ?? 'User'} There 👋',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
            ).paddingLeft(20.w),
            Text(
              'Let’s start working!',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ).paddingLeft(20.w),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    ),
  );
}
