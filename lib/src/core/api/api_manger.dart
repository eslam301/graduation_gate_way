import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'models/login_response.dart';
import 'models/user.dart';

class ApiManger {
  static const String baseUrl = 'http://graduationgetaway.somee.com';
  static final http.Client client = http.Client();

  static getDoctors() async {
    final response = await http.get(Uri.parse('$baseUrl/api/Doctors'));

    //print(response.body);
    return response;
  }

  static Future<User> login(
      {String userName = 'test', String password = 'test123'}) async {
    final body = jsonEncode({
      "username": userName,
      "password": password,
    });
    final response = await client.post(
      Uri.parse('$baseUrl/api/Token/Login'),
      body: body,
      headers: {
        'Content-Type': 'application/json', // Set content type to JSON
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(responseBody);
      User user = loginResponse.user!;
      // SharedPreferencesService().save(
      //   'role' , roleToString(loginResponse.role!),
      // );
      Get.snackbar('success', 'Login successfully');
      return user;
    } else if (response.statusCode == 400) {
      Get.snackbar('Error', 'Invalid username or password');
      throw Exception('Invalid username or password');
    } else {
      Get.snackbar('Error', 'Failed to login');
      throw Exception('Failed to login');
    }
  }
}
