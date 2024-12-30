import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/projects_recommendations.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../../core/route/routes_name.dart';
import '../../data/caption.dart';
import '../../data/model/caption_model.dart';

class CaptionController extends GetxController {
  File? file;
  bool isLoading = false;
  List<ProjectRecommendationModel>? projects;

  final api = Get.find<ApiCaption>();

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
    update();
  }

  submit() async {
    isLoading = true;
    update();
    log('submit');

    CaptionModel response = await api.getCaption(image: file ?? File(''));
    projects = List.generate(
      response.data.length,
      (index) => ProjectRecommendationModel(
        title: response.data[index].title,
        imageLink: file?.path,
        description: response.data[index].description,
        difficultyLevel: response.data[index].level,
      ),
    );
    log(projects.toString());
    Routes.projectRecommendationResultPage
        .toPage(arguments: {'projectsRecommendationsResult': projects});
    log(projects.toString());
    isLoading = false;
    update();
  }
}
