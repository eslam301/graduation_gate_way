import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../services/shared_pref.dart';
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
      {String userName = 'fady_yosrey', String password = '123456'}) async {
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
      Get.snackbar('success', 'Login successfully');
      final Map<String, dynamic> responseBody = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(responseBody);
      User user = loginResponse.user!;
      // SharedPreferencesService().save(
      //   'role' , roleToString(loginResponse.role!),
      // );

      return user;
    } else if (response.statusCode == 400) {
      Get.snackbar('Error', 'Invalid username or password');
      throw Exception('Invalid username or password');
    }else {
      throw Exception('Failed to login');
    }
  }
}
