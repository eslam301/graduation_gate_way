import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/api/models/projects_recommendations.dart';
import '../../../../core/route/routes_name.dart';

abstract class ProjectPageViewDetailsController extends GetxController {
  registerProject() {}
}

class ProjectPageViewDetailsControllerImp
    extends ProjectPageViewDetailsController {
  late final ProjectRecommendationModel project;

  @override
  void onInit() {
    project = Get.arguments;
    print('project is ${project.toString()}');
    super.onInit();
  }

  @override
  registerProject() {
    Routes.projectRegistration.toPage(arguments: {'projectModel': project});
  }
}
