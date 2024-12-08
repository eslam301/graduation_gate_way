import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences prefs;

  SharedPreferencesService() {
    init();
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
  }


  saveKey(String key, String value) async {
    prefs.setString(key, value);
  }

  saveList(){

  }

  get(String key) {
    if (!prefs.containsKey(key)) return null;
    return prefs.getString(key);
  }
}