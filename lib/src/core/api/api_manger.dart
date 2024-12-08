import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/user.dart';

class ApiManger {
  static const String baseUrl = 'http://graduationgetaway.somee.com';
  static final http.Client client = http.Client();

  static getDoctors() async {
    final response = await http.get(Uri.parse('$baseUrl/api/Doctors'));

    print(response.body);
    return response;
  }

  static Future<User?> loginDoctor(
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
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return User.fromJson(responseBody);
    } else {
      throw Exception('Failed to login');
    }
  }
}
