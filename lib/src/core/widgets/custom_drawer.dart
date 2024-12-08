import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../route/routes_name.dart';
import '../theme/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawerItems = [
      DrawerItem(title: 'Home', icon: const Icon(Icons.home)),
      DrawerItem(title: 'Profile', icon: const Icon(Icons.person)),
      DrawerItem(title: 'Settings', icon: const Icon(Icons.settings)),
      DrawerItem(title: 'Logout', icon: const Icon(Icons.logout) , onTap: (){
        Routes.login.offAllPage();
      }),
    ];
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
            ),
            child: Center(
              child: Text(
                'Graduation Getaway',
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,

                style: TextStyle(
                  color: AppColors.white,
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ...List<Widget>.generate(
              drawerItems.length,
              (index) => ListTile(
                    title: Text(drawerItems[index].title),
                    leading: drawerItems[index].icon,
                    onTap: drawerItems[index].onTap,
                  )),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final Widget icon;
  final void Function()? onTap;
  DrawerItem({required this.title, required this.icon, this.onTap});
}
