import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

import 'models/login_response.dart';
import 'models/projects_recommendations.dart';
import 'models/user.dart';

class ApiManager {
  static const String baseUrl = 'http://graduationgetaway.somee.com';
  static const String projectRecommendationBaseUrl =
      'https://fadyyosrey.pythonanywhere.com';
  final http.Client client;

  ApiManager({required this.client});

  /// Default headers for API requests
  static const Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
  };

  /// Sends a GET request to fetch a list of doctors.
  ///
  Future<List<dynamic>> getDoctors() async {
    final url = Uri.parse('$baseUrl/api/Doctors');
    try {
      final response = await client.get(url, headers: baseHeaders);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        _handleHttpError(response);
      }
    } catch (e) {
      rethrow;
    }
    return [];
  }

  /// Logs in the user and returns a [User] object.
  Future<User> login({
    String? userName = 'eslam',
    String? password = 'eslam123',
  }) async {
    final url = Uri.parse('$baseUrl/api/Token/Login');
    final body = jsonEncode({
      "username": userName,
      "password": password,
    });

    try {
      final response = await client.post(url, body: body, headers: baseHeaders);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(responseBody);
        Get.snackbar('Success', 'Login successfully');
        //print(loginResponse.user.toString());
        SharedPref.saveUserData(loginResponse.user!);
        SharedPref.saveUserId(loginResponse.user!.id.toString());
        return loginResponse.user!;
      } else if (response.statusCode == 400) {
        Get.snackbar('Error', 'Invalid username or password');
        throw Exception('Invalid username or password');
      } else {
        _handleHttpError(response);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to login');
      rethrow;
    }
    // Throw a fallback exception to ensure all paths return a value
    throw Exception('Unexpected error during login');
  }

  /// sign up

  /// Sends user answers for project recommendations and returns recommendations.
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
        _handleHttpError(response);
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

  /// Handles HTTP errors by throwing appropriate exceptions.
  void _handleHttpError(http.Response response) {
    final message = 'HTTP Error:${response.body}';
    //Get.snackbar('Error', response.body);
    throw Exception(message);
  }

  /// Disposes of the HTTP client.
  void dispose() {
    client.close();
  }
}
