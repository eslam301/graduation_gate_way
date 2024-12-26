import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../manager/grades_controller.dart';
import '../widgets/grades_body.dart';

class GradesPageView extends StatelessWidget {
  const GradesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final GradesController controller = Get.put(GradesController());
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Grades',
      ),
      body: GradesBody(
        controller: controller,
      ),
    );
  }
}
