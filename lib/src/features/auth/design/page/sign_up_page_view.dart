import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';
import '../../../../core/theme/app_color.dart';
import '../controller/sign_up_controller.dart';
import '../layout/auth_layout.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return AuthLayout(
      title: 'Select sign up type',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/svg/Questions_amico.svg'),
          const Text('How would you like to use this app?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const Text(
            'Select an option',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () {
                Routes.signUpAsDoctor.toPage();
              },
              child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset('assets/images/doctor.png'),
                      const Text('As Doctor'),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                Routes.signUpAsStudent.toPage();
              },
              child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset('assets/images/Student.png'),
                      const Text('As Student'),
                    ],
                  )),
            )
          ])
        ],
      ),
    );
  }
}
