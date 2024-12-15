import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/home/controller/home_layout_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLayoutControllerImp>(() => HomeLayoutControllerImp());
  }
}
