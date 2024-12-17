import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/core/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

import '../error/error_handel_api.dart';
import 'models/login_response.dart';
import 'models/register_project_model.dart';
import 'models/user.dart';

class ApiManager {
  static const String baseUrl = 'http://graduationgetaway.somee.com';

  final http.Client client;

  ApiManager({required this.client});

  /// Default headers for API requests
  static const Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
  };

  /// Sends a GET request to fetch a list of doctors.
  Future<List<DoctorModel>> getDoctors() async {
    final url = Uri.parse('$baseUrl/api/Doctors');
    try {
      // Send HTTP GET request
      final response = await client.get(url, headers: baseHeaders);

      if (response.statusCode == 200) {
        // Decode response body to a List of Map objects
        final List<dynamic> decodedData = jsonDecode(response.body);

        // Map each JSON object to a DoctorModel
        return decodedData.map((json) => DoctorModel.fromJson(json)).toList();
      } else {
        // Handle HTTP errors
        handleHttpError(response);
      }
    } catch (e) {
      // Rethrow exceptions for the caller to handle
      rethrow;
    }

    // Return an empty list in case of errors (optional, usually unreachable due to rethrow)
    return [];
  }

  registerProject(RegisterProjectModel project) async {
    final url = Uri.parse('$baseUrl/api/Project/add-project');
    final body = jsonEncode(project.toJson());
    try {
      log('body: $body');
      final response = await client.post(url, body: body, headers: baseHeaders);

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Project registered successfully');
        log('Project registered successfully${response.body}');
      } else if (response.statusCode == 400) {
        Get.snackbar('Error', 'Project already registered');
      } else {
        handleHttpError(response);
        log('Failed to register project${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register project');
      rethrow;
    }
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
        final LoginResponse loginResponse =
            LoginResponse.fromJson(responseBody);
        final User user = loginResponse.getUser()!;
        log('Login successfully : ${user.toString()}');
        Get.snackbar('Success', 'Login successfully');
        //print(loginResponse.user.toString());
        SharedPref.saveUserData(user);
        SharedPref.saveUserId(user.id.toString());
        return user;
      } else if (response.statusCode == 400) {
        Get.snackbar('Error', 'Invalid username or password');
        throw Exception('Invalid username or password');
      } else {
        handleHttpError(response);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to login');
      rethrow;
    }
    // Throw a fallback exception to ensure all paths return a value
    throw Exception('Unexpected error during login');
  }

  /// Disposes of the HTTP client.
  void dispose() {
    client.close();
  }
}
