import 'package:get/get.dart';

import '../../../../core/api/models/projects_recommendations.dart';

abstract class ProjectPageViewDetailsController extends GetxController {}

class ProjectPageViewDetailsControllerImp
    extends ProjectPageViewDetailsController {
  late final ProjectsRecommendations project;

  @override
  void onInit() {
    project = Get.arguments;
    //print('project is ${project.toString()}');
    super.onInit();
  }
}
