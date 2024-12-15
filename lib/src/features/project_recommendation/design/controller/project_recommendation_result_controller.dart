import 'package:get/get.dart';

import '../../../../core/api/models/projects_recommendations.dart';
import '../../../../core/api/models/user.dart';

abstract class ProjectRecommendationResultController extends GetxController {}

class ProjectRecommendationResultControllerImp
    extends ProjectRecommendationResultController {
  late final User user;

  late final List<ProjectRecommendationModel> projectsRecommendationsResult;

  @override
  void onInit() {
    final Map<String, dynamic> arguments = Get.arguments;
    projectsRecommendationsResult = arguments['projectsRecommendationsResult'];
    user = arguments['user'];
    super.onInit();
  }
}
