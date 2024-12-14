import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';
import 'package:graduation_gate_way/src/core/widgets/components/custom_search_bar.dart';

import '../../../../core/theme/app_color.dart';
import '../../controller/home_layout_controller.dart';

PreferredSize homeAppBar() {
  final HomeLayoutControllerImp controller =
      Get.find<HomeLayoutControllerImp>();

  return PreferredSize(
    preferredSize: Size.fromHeight(180.h),
    child: Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          )),
      child: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white, size: 30),
        backgroundColor: Colors.transparent,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomSearchBar(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Hi, ${controller.user.firstname ?? 'User'} There 👋',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
            ).paddingLeft(10.w),
            Text(
              'Let’s start working!',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ).paddingLeft(10.w),
          ],
        ),
      ),
    ),
  );
}
