import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/api/models/projects_recommendations.dart';
import '../../../../../core/error/error_handel_api.dart';

class ProjectRecommendationApi {
  static const String projectRecommendationBaseUrl =
      'https://repo-production-7c34.up.railway.app/predict';

  final http.Client client;

  static const Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
  };

  ProjectRecommendationApi({required this.client});

  Future<List<ProjectRecommendationModel>> sendUserAnswerProjectRecommendation({
    required Map<String, dynamic> userAnswers,
  }) async {
    final url = Uri.parse(projectRecommendationBaseUrl);
    final body = jsonEncode(userAnswers);
    //print(body);
    try {
      final response = await client.post(url, body: body, headers: baseHeaders);

      if (response.statusCode == 200) {
        // Clean up the JSON response
        final sanitizedResponseBody = response.body.replaceAll('NaN', 'null');
        final List<ProjectRecommendationModel> recommendations = [
          ProjectRecommendationModel.fromJson(jsonDecode(sanitizedResponseBody))
        ];
        return recommendations;
      } else {
        handleHttpError(response);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to get project recommendations');
      // if (kDebugMode) {
      //   print(e.toString());
      // }
      rethrow;
    }
    throw Exception('Unexpected error during project recommendations');
  }
}
