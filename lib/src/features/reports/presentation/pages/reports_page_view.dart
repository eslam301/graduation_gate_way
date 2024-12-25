import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/custom_text_form_field.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/functions/validator.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../manager/report_controller.dart';

class ReportsPageView extends StatelessWidget {
  const ReportsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    ReportController controller = Get.put(ReportController());
    return Scaffold(
        endDrawer: const CustomDrawer(),
        appBar: generalAppBar(
          title: 'Reports',
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 120),
          child: SurfaceContainer(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const Text('Weakly Reports'),
                  CustomTextFormField(
                    labelText: 'Project Name',
                    suffixIcon: Icons.add,
                    controller: controller.projectNameController,
                    validator: (value) => validateEmpty(value),
                  ),
                  CustomTextFormField(
                    labelText: 'file Name',
                    suffixIcon: Icons.add,
                    controller: controller.projectFileNameController,
                    validator: (value) => validateEmpty(value),
                  ),
                  CustomTextFormField(
                      labelText: 'Supervisor Name',
                      suffixIcon: Icons.add,
                      controller: controller.superVisorNameController,
                      validator: (value) => validateEmpty(value)),
                  CustomTextFormField(
                    labelText: 'Task completed this week',
                    maxLines: 5,
                    controller: controller.taskCompletedController,
                  ),
                  CustomTextFormField(
                    labelText: 'Task prepared next week:',
                    maxLines: 5,
                    controller: controller.taskPreparedController,
                  ),
                  MainButton(
                      onPressed: () {
                        controller.import();
                      },
                      text: 'Import'),
                ],
              ),
            ),
          ),
        ));
  }
}
