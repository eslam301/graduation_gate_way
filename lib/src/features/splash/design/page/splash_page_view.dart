import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/const/image_pathes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/small_round_button.dart';
import '../../controller/splash_controller.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashControllerImp());
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text('Graduation Getaway',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text('Your guide to graduate.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SvgPicture.asset(
                AppImagePathSvg.splash,
                width: 300.w,
                height: 300.h,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 224.w,
                height: 48.h,
                child: SmallRoundButton(
                  text:'Sign up',
                  color: Colors.white,
                  textColor: AppColors.textColor,
                  onPressed: (){
                    controller.navigateToSignUp();
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 224.w,
                height: 48.h,
                child: SmallRoundButton(
                  onPressed:(){
                    controller.navigateToLogin();
                  },
                  text:'Log in',
                  color: Colors.transparent,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
