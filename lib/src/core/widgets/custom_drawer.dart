import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/utils/shared_pref.dart';

import '../api/models/user.dart';
import '../route/routes_name.dart';
import '../theme/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerItems = [
      DrawerItem(
        title: 'Home',
        icon: Icons.home,
        onTap: () => Routes.home.getBackToPage(),
      ),
      DrawerItem(
        title: 'Profile',
        icon: Icons.person,
        onTap: () => Routes.profile.toPage(),
      ),
      DrawerItem(
        title: 'Logout',
        icon: Icons.logout,
        onTap: () {
          Routes.login.offAllPage();
          Get.delete<User>(force: true);
          SharedPref.clearUserId();
        },
      ),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 0.3.sh,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.mainColor),
              child: Center(
                child: Text(
                  'Graduation Getaway',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    letterSpacing: 2,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ...drawerItems.map((item) => ListTile(
                title: Text(item.title),
                leading: Icon(item.icon),
                onTap: item.onTap,
              )),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const DrawerItem({required this.title, required this.icon, this.onTap});
}
