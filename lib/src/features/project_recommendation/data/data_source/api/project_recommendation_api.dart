import 'dart:convert';
import 'dart:io';

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

    try {
      final response = await client.post(url, body: body, headers: baseHeaders);

      if (response.statusCode == 200) {
        // تنظيف النص واستبدال NaN بـ null إذا لزم الأمر
        final sanitizedResponseBody = response.body.replaceAll('NaN', 'null');
        final Map<String, dynamic> jsonResponse =
            jsonDecode(sanitizedResponseBody);

        // التحقق من وجود `top_predictions`
        if (jsonResponse.containsKey('top_predictions') &&
            jsonResponse['top_predictions'] is List) {
          final List<dynamic> predictionsJson = jsonResponse['top_predictions'];
          final List<ProjectRecommendationModel> recommendations =
              predictionsJson
                  .map((item) => ProjectRecommendationModel.fromJson(
                      item as Map<String, dynamic>))
                  .toList();
          return recommendations;
        } else {
          throw Exception("Invalid API response format");
        }
      } else {
        handleHttpError(response);
      }
    } on SocketException {
      Get.snackbar('Network Error', 'Please check your internet connection.');
    } on FormatException {
      Get.snackbar('Parsing Error', 'Failed to parse the response.');
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
      rethrow;
    }

    throw Exception('Unexpected error during project recommendations');
  }
}
