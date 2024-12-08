import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart';

void main() {
  runApp(const GraduationGateWay());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // Makes the navigation bar transparent
    systemNavigationBarIconBrightness: Brightness.light, // Sets the icon brightness
    statusBarColor: Colors.transparent, // Transparent status bar
    statusBarIconBrightness: Brightness.light, // Sets status bar icon brightness
  ));
  // Ensure edge-to-edge layout
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

