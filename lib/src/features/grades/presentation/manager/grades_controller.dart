import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';

import '../../../../core/api/api_manger.dart';
import '../../../../core/api/models/user.dart';
import '../../../../core/widgets/multi_answer_search.dart';
import '../../../project_registeration/data/models/project_model.dart';
import '../../data/data_sources/get_project_by_dr_id.dart';

class GradesController extends GetxController {
  List<ProjectModel> projects = [];
  RxList grades = [].obs;
  ProjectModel selectedProject = ProjectModel();
  User user = Get.find<User>();

  void selectProjectId(int id) {
    log(id.toString());
    selectedProject = projects.firstWhere((element) => element.id == id);
    grades.value = selectedProject.students ?? [];
    log(grades.toString());
    update(); // Notify UI to rebuild after data change.
  }

  Future<void> updateStudentGrade(int studentId, String grade) async {
    ApiManager apiManager = Get.find<ApiManager>();
    await apiManager.updateStudentGrade(studentId, grade);
    projects = await apiManager.getProjectByDoctorId(user.id!);
    update();
  }

  Future<List<ProjectModel>> getProjects() async {
    ApiManager apiManager = Get.find<ApiManager>();
    projects = await apiManager.getProjectByDoctorId(user.id!);
    return projects;
  }

  @override
  void onInit() async {
    log('init');
    projects = await getProjectByDrId(user.id!);
    log('init');
    super.onInit();
  }

  showUpdateGrade(int studentId) {
    log(studentId.toString());
    String selectedGrade = '';
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) => SurfaceContainer(
        padding: 20,
        child: Column(
          children: [
            Text(
              'Update Grade',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            MultiDropDownWidget(
              hintText: 'Select Grade',
              isSingleSelect: true,
              selectionListItemMethod: (value) {
                selectedGrade = value[0].toString();
              },
              items: const [
                'A+',
                'A',
                'A-',
                'B+',
                'B',
                'B-',
                'C+',
                'C',
                'C-',
                'D+',
                'D',
                'D-',
                'F',
              ],
            ),
            const SizedBox(height: 16.0),
            MainButton(
              onPressed: () {
                log(studentId.toString());
                updateStudentGrade(studentId, selectedGrade);
                getBack();
              },
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
