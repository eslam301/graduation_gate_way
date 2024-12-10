import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/splash/design/page/splash_page_view.dart';


class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const LoginAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Get.offAll(
              () => const SplashPageView() ,
              transition: Transition.leftToRight,
            );
          },
          icon: Icon(Icons.close,size: 24.sp,weight: 30,),
        ),
      ],
      // leading: IconButton(
      //   onPressed: () {
      //     getBack() ;
      //   },
      //   icon: Icon(Icons.arrow_back_ios_new,size: 24.sp,weight: 30,),
      // ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
