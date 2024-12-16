import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/api/models/projects_recommendations.dart';
import '../../../../../core/error/error_handel_api.dart';

class ProjectRecommendationApi {
  static const String projectRecommendationBaseUrl =
      'https://fadyyosrey.pythonanywhere.com';

  final http.Client client;

  static const Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
  };

  ProjectRecommendationApi({required this.client});

  Future<List<ProjectRecommendationModel>> sendUserAnswerProjectRecommendation({
    required Map<String, dynamic> userAnswers,
  }) async {
    final url = Uri.parse('$projectRecommendationBaseUrl/recommend');
    final body = jsonEncode(userAnswers);
    try {
      final response = await client.post(url, body: body, headers: baseHeaders);
      // if (kDebugMode) {
      //   print('Raw response: ${response.body}');
      // }

      if (response.statusCode == 200) {
        // Clean up the JSON response
        final sanitizedResponseBody = response.body.replaceAll('NaN', 'null');
        final List<ProjectRecommendationModel> recommendations =
            (jsonDecode(sanitizedResponseBody) as List)
                .map((recommendation) =>
                    ProjectRecommendationModel.fromJson(recommendation))
                .toList();
        // Parse sanitized JSON
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
