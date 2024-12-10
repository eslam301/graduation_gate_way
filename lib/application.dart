import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/route/routes_name.dart';
import 'package:graduation_gate_way/src/core/theme/app_theme.dart';

class GraduationGateWay extends StatelessWidget {
  const GraduationGateWay({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 300),
          getPages: AppRouter.pagesRoute,
          initialRoute: Routes.onSplash,
        );
      }
    );
  }
}