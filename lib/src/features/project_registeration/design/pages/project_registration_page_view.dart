import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/components/main_button.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../manager/project_register_controller.dart';
import '../widgets/input_section_doctor.dart';
import '../widgets/input_section_student.dart';

class ProjectRegistrationPageView extends StatelessWidget {
  const ProjectRegistrationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectRegisterControllerImp controller =
        Get.put(ProjectRegisterControllerImp());

    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Project Registration',
        centerTitle: true,
        height: 70,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              allowImplicitScrolling: true,
              children: [
                ListView.separated(
                  cacheExtent: 1000,
                  padding: const EdgeInsets.all(20),
                  itemCount: controller.studentNameList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return InputSectionStudent(
                      index: index,
                      nameController: controller.studentNameList[index],
                      idController: controller.studentIdList[index],
                    );
                  },
                ),
                ListView.separated(
                  cacheExtent: 1000,
                  padding: const EdgeInsets.all(20),
                  itemCount: controller.doctorsNameList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return InputSectionDoctor(
                      index: index,
                      doctorController: controller.doctorsNameList[index],
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 20),
            child: Obx(
              () => MainButton(
                onPressed: controller.isLastPage()
                    ? controller.submit
                    : controller.nextPage,
                text: controller.isLastPage() ? 'Submit' : 'Next',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
