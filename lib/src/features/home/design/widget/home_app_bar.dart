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
    preferredSize: const Size.fromHeight(180),
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
            const SizedBox(
              height: 20,
            ),
            Text(
              'Hi, ${controller.user.firstname ?? 'User'} There 👋',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
            ).paddingLeft(10.w),
            const Text(
              'Let’s start working!',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ).paddingLeft(10),
          ],
        ),
      ),
    ),
  );
}
