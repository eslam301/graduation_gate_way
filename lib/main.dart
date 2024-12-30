import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/utils/shared_pref.dart';

import 'application.dart';
import 'init_main.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await initMain();

  final String? userId = SharedPref.getUserId();

  runApp(GraduationGateWay(userId: userId));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    // Makes the navigation bar transparent
    systemNavigationBarIconBrightness: Brightness.light,
    // Sets the icon brightness
    statusBarColor: Colors.transparent,
    // Transparent status bar
    statusBarIconBrightness:
        Brightness.light, // Sets status bar icon brightness
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Ensure edge-to-edge layout
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}
