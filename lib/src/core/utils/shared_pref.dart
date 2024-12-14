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

  static Future<bool> saveList<T>(String key, List<T> list) async {
    log('Resetting and saving list to SharedPreferences');

    List<String> jsonList = list.map((item) => jsonEncode(item)).toList();

    // Overwrite (reset) the value of the key in SharedPreferences
    return await _prefs?.setStringList(key, jsonList) ?? false;
  }

  static Future<List<T>> getList<T>(String key) async {
    List<String>? jsonList = _prefs?.getStringList(key);
    log('jsonList: ${jsonList?.length}', level: 1);
    if (jsonList == null) return [];

    try {
      // Decode each JSON string back into its object form
      return jsonList.map<T>((json) {
        dynamic decoded = jsonDecode(json);

        return decoded as T; // Cast to generic type
      }).toList();
    } catch (e) {
      log('Error decoding list from SharedPreferences: $e');
      return [];
    }
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

  static Future<bool> clearDataIn(String key) async {
    return await _prefs!.remove(key);
  }

  static Future<void> clearAll() async {
    log('clear all');
    await _prefs!.clear();
  }
}
