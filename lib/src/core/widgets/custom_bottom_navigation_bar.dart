import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../const/image_pathes.dart';
import '../route/routes_name.dart';
import '../theme/app_color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
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
            _myItemsPath[index].onTab!();
          });
        },
        items: List.generate(
          _myItemsPath.length,
          (index) => BottomNavigationBarItem(
            icon: Image.asset(
              _myItemsPath[index].iconPath,
              color: AppColors.white,
            ),
            label: _myItemsPath[index].label,
            activeIcon: Container(
                width: 40.w,
                height: 40.h,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteBackGround,
                ),
                child: Image.asset(
                  _myItemsPath[index].iconPath,
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
  final void Function()? onTab;

  const MyBottomNavigationBarItem({
    required this.iconPath,
    required this.label,
    this.onTab,
  });
}

List<MyBottomNavigationBarItem> _myItemsPath = [
  const MyBottomNavigationBarItem(
      iconPath: AppImagePath.houseIcon, label: 'Home'),
  MyBottomNavigationBarItem(
    iconPath: AppImagePath.chatIcon,
    label: 'chat',
    onTab: () {
      Routes.chat.toPage();
    },
  ),
  const MyBottomNavigationBarItem(
      iconPath: AppImagePath.notificationIcon, label: 'notification'),
  const MyBottomNavigationBarItem(
      iconPath: AppImagePath.briefingIcon, label: 'Report'),
  const MyBottomNavigationBarItem(
      iconPath: AppImagePath.userIcon, label: 'profile'),
];
