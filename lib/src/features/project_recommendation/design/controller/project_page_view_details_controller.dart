import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/api/models/projects_recommendations.dart';

abstract class ProjectPageViewDetailsController extends GetxController {

}

class ProjectPageViewDetailsControllerImp extends ProjectPageViewDetailsController {
  late final ProjectsRecommendations project;




  @override
  void onInit() {
    project = Get.arguments;
    print('project is ${project.toString()}');
    super.onInit();
  }
}