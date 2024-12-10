import 'package:get/get.dart';

import '../../../../core/api/models/user.dart';

abstract class ProjectRecommendationController extends GetxController {

}

class ProjectRecommendationControllerImp extends ProjectRecommendationController {
  late final User user;

  @override
  void onInit() {
    user = Get.arguments as User;
    super.onInit();
  }
}