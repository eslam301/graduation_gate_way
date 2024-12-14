import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const CustomDrawer(),
        appBar: generalAppBar(
          title: 'Profile',
          centerTitle: true,
          height: 80,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/user_image.png',
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'User Name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1.w),
            ...List.generate(
                ProfileItem._profileItems.length,
                (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      style: ListTileStyle.drawer,
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: AppColors.grey,
                      ),
                      leading: Icon(
                        ProfileItem._profileItems[index].icon,
                        size: 30.sp,
                        color: AppColors.black,
                      ),
                      onTap: () {},
                      title: Text(ProfileItem._profileItems[index].title),
                    )),
            Divider(color: Colors.grey, thickness: 1.w),
            ...List.generate(
                ProfileItem._accountItems.length,
                (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      style: ListTileStyle.drawer,
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: AppColors.grey,
                      ),
                      leading: Icon(
                        ProfileItem._accountItems[index].icon,
                        size: 30.sp,
                        color: AppColors.black,
                      ),
                      onTap: () {},
                      title: Text(ProfileItem._accountItems[index].title),
                    )),
          ],
        ).paddingAll(20.w));
  }
}

class ProfileItem {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  static final List<ProfileItem> _profileItems = [
    ProfileItem(title: 'Name', icon: Icons.person),
    ProfileItem(title: 'Phone', icon: Icons.call),
    ProfileItem(title: 'Mail', icon: Icons.mail),
    ProfileItem(title: 'change password', icon: Icons.lock),
  ];
  static final List<ProfileItem> _accountItems = [
    ProfileItem(title: 'Notification', icon: Icons.notifications),
    ProfileItem(title: 'help', icon: Icons.help),
    ProfileItem(title: 'about', icon: Icons.info),
    ProfileItem(title: 'Logout', icon: Icons.logout),
  ];

  ProfileItem({required this.title, required this.icon, this.onTap});
}
