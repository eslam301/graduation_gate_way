import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

PreferredSize generalAppBar({
  String? userName,
  String? subTitle,
  String? title,
  int height = 80,
  bool centerTitle = true,
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
                  fontSize: title.length > 20 ? 18 : 21,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (userName != null) _buildGreeting(userName),
              if (!centerTitle && subTitle != null) _buildSubtitle(subTitle),
              const SizedBox(height: 10),
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
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
  );
}

Widget _buildSubtitle(String subTitle) {
  return Text(
    subTitle,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );
}
