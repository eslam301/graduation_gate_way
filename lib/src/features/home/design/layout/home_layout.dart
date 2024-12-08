import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_gate_way/src/core/widgets/main_button.dart';

import '../../../../core/api/api_manger.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../controller/home_layout_controller.dart';
import '../widget/custom_bottom_navigation_bar.dart';
import 'home_app_bar.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLayoutControllerImp controller = Get.put(HomeLayoutControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: homeAppBar(controller: controller),
      endDrawer: const CustomDrawer(),
      body: Center(child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          MainButton(onPressed: (){
            ApiManger.loginDoctor();
          }, text: 'login',),
          MainButton(onPressed: (){
            ApiManger.getDoctors();
          }, text: 'get',),
        ],
      )),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
