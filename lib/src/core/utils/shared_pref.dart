import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/models/user.dart';

class SharedPref {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveUserId(String userId) async {
    log('save user id');
    return await _prefs!.setString('user_id', userId);
  }

  static Future<bool> saveUserData(User user) async {
    // Use JSON encoding for proper serialization
    return await _prefs!.setString('user_data', json.encode(user.toJson()));
  }

  static Future<User> getUserData() async {
    String? userData = _prefs!.getString('user_data');
    if (userData != null) {
      log('user data is $userData');
      // Decode the JSON string to a map and then create a User object
      return User.fromJson(json.decode(userData));
    }
    return User(); // Return an empty user if no data is found
  }

  static String? getUserId() {
    return _prefs!.getString('user_id');
  }

  static Future<bool> clearUserId() async {
    return await _prefs!.remove('user_id');
  }

  static Future<bool> clearAll() async {
    log('clear all');
    return await _prefs!.clear();
  }
}
