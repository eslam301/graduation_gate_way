import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/const/image_pathes.dart';
import '../../../../core/theme/app_color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<MyBottomNavigationBarItem> itemsPath;

  const CustomBottomNavigationBar({
    super.key,
    this.itemsPath = myItemsPath,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        elevation: 0,
        iconSize: 24.sp,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: List.generate(
          widget.itemsPath.length,
          (index) => BottomNavigationBarItem(
            icon: Image.asset(widget.itemsPath[index].iconPath , color: AppColors.white,),
            label: widget.itemsPath[index].label,
            activeIcon: Container(
                width: 40.w,
                height: 40.h,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteBackGround,
                ),
                child: Image.asset(
                  widget.itemsPath[index].iconPath,
                  color: AppColors.black,
                )),
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBarItem {
  final String iconPath;
  final String label;
  const MyBottomNavigationBarItem(
      {required this.iconPath, required this.label});
}

const List<MyBottomNavigationBarItem> myItemsPath = [
  MyBottomNavigationBarItem(iconPath: AppImagePath.houseIcon, label: 'Home'),
  MyBottomNavigationBarItem(iconPath: AppImagePath.chatIcon, label: 'chat'),
  MyBottomNavigationBarItem(
      iconPath: AppImagePath.notificationIcon, label: 'notification'),
  MyBottomNavigationBarItem(
      iconPath: AppImagePath.briefingIcon, label: 'Report'),
  MyBottomNavigationBarItem(iconPath: AppImagePath.userIcon, label: 'profile'),
];
