import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/doctors_model.dart';
import 'package:graduation_gate_way/src/core/api/models/student_model.dart';
import 'package:http/http.dart' as http;

import '../error/error_handel_api.dart';
import 'models/login_response.dart';
import 'models/register_project_model.dart';
import 'models/track_model.dart';
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

  Future<List<TrackModel>> getTracks() async {
    final url = Uri.parse('$baseUrl/api/Tracks');
    try {
      // Send HTTP GET request
      final response = await client.get(url, headers: baseHeaders);

      if (response.statusCode == 200) {
        // Decode response body to a List of Map objects
        final List<dynamic> decodedData = jsonDecode(response.body);

        // Map each JSON object to a TrackModel
        return decodedData.map((json) => TrackModel.fromJson(json)).toList();
      } else {
        // Handle HTTP errors
        handleHttpError(response);
      }
    } catch (e) {
      // Rethrow exceptions for the caller to handle
      log(e.toString());
      rethrow;
    }
    throw [];
  }

  Future<StudentModel> signUpStudent({required StudentModel student}) async {
    final url = Uri.parse('$baseUrl/api/Student');
    final body = jsonEncode(student.toJsonBody());
    try {
      log('body: $body');
      final response = await client.post(url, body: body, headers: baseHeaders);
      if (response.statusCode == 200) {
        log('Student registered successfully${response.body}');
        Get.snackbar('Success', 'Student registered successfully');
        return StudentModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        log('Failed to register student${response.body}');
        Get.snackbar('Error', 'Failed to register student${response.body}');
      } else {
        handleHttpError(response);
        log('Failed to register student${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register student');
    }
    throw Exception('Failed to register student');
  }

  Future<DoctorModel> signUpDoctor({required DoctorModel doctor}) async {
    final url = Uri.parse('$baseUrl/api/Doctors');
    final body = jsonEncode(doctor.toJsonBody());
    log('body: $body');
    try {
      log('body: $body');
      final response = await client.post(url, body: body, headers: baseHeaders);
      if (response.statusCode == 200) {
        log('Doctor registered successfully${response.body}');
        Get.snackbar('Success', 'Doctor registered successfully');
        return DoctorModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        log('Failed to register doctor${response.body}');
        Get.snackbar('Error', 'Failed to register doctor${response.body}');
      } else {
        handleHttpError(response);
        log('Failed to register doctor${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register Doctor');
    }
    throw Exception('Failed to register doctor');
  }

  registerProject(RegisterProjectModel project) async {
    final url = Uri.parse('$baseUrl/api/Project/add-project');
    final body = jsonEncode(project.toJsonBody());
    try {
      log('body: $body');
      final response = await client.post(url, body: body, headers: baseHeaders);
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Project registered successfully');
        log('Project registered successfully${response.body}');
      } else if (response.statusCode == 400) {
        log('Failed to register project${response.body}');
        Get.snackbar('Error', 'Failed to register project${response.body}');
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
    String? userName,
    String? password,
  }) async {
    final url = Uri.parse('$baseUrl/api/Token/Login');
    final body = jsonEncode({
      "username": userName ?? 'test',
      "password": password ?? 'test123',
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
