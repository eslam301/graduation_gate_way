import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:graduation_gate_way/src/core/binding/app_binding.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/route/routes_name.dart';
import 'package:graduation_gate_way/src/core/theme/app_theme.dart';

class GraduationGateWay extends StatelessWidget {
  final String? userId;
  late final String initialRoute;

  GraduationGateWay({super.key, this.userId}) {
    initialRoute = userId == null ? Routes.splash : Routes.home;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          ScreenUtil.init(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            defaultTransition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 300),
            //home: const Testing(),
            getPages: AppRouter.pagesRoute,
            initialRoute: initialRoute,
            initialBinding: MyBinding(),
          );
        });
  }
}
