import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/const/image_pathes.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/theme/app_color.dart';

import '../../../../core/route/routes_name.dart';

class OnSplashPageView extends StatefulWidget {
  const OnSplashPageView({super.key});

  @override
  State<OnSplashPageView> createState() => _OnSplashPageViewState();
}

class _OnSplashPageViewState extends State<OnSplashPageView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4),(){
      Routes.splash.toPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImagePath.onSplash,
              width: 150.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50.h,
            ),
            Text('Graduation Getaway', style: theme.textTheme.headlineMedium,),
            SizedBox(
              height: 50.h,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
