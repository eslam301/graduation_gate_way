import 'package:flutter/cupertino.dart';
import 'package:graduation_gate_way/src/core/locator/injection_config.dart';
import 'package:graduation_gate_way/src/core/utils/shared_pref.dart';

Future<void> initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SharedPref.init();
  await setupLocator();
}
