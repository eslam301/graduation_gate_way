import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_color.dart';

PreferredSize generalAppBar({
  String? userName,
  String? subTitle,
  String? title,
  int height = 130,
  bool centerTitle = false,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height.h),
    child: Container(
      padding: EdgeInsets.all(10.w),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white, size: 30),
        backgroundColor: Colors.transparent,
        centerTitle: centerTitle,
        title: title == null
            ? null
            : Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (userName != null) _buildGreeting(userName),
              if (!centerTitle && subTitle != null) _buildSubtitle(subTitle),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildGreeting(String userName) {
  return Text(
    'Hi, $userName There 👋',
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
  );
}

Widget _buildSubtitle(String subTitle) {
  return Text(
    subTitle,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );
}
