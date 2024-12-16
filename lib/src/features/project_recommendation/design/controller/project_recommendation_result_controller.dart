import 'package:get/get.dart';

import '../../../../core/api/models/projects_recommendations.dart';

abstract class ProjectRecommendationResultController extends GetxController {
  late final List<ProjectRecommendationModel> projectsRecommendationsResult;
}

class ProjectRecommendationResultControllerImp
    extends ProjectRecommendationResultController {
  @override
  void onInit() {
    final Map<String, dynamic> arguments = Get.arguments;
    projectsRecommendationsResult = arguments['projectsRecommendationsResult'];
    super.onInit();
  }
}
