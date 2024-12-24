import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Testing'),
        MainButton(
          onPressed: () {
            final ApiManager apiManager = Get.find<ApiManager>();
            apiManager.getMyProjectById(1);
          },
          text: 'Login',
        ),
      ],
    ));
  }
}
