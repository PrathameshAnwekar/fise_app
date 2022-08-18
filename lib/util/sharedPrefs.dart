import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefs {
  static SharedPreferences? _prefs;

  static Future init() async =>
      _prefs = await SharedPreferences.getInstance();

  Future setBool(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }
  Future setString(String key, String value) async {
    await _prefs!.setString(key, value);
  }
   getBool(String key) async {
    return _prefs!.getBool(key);
  }
  Future getString(String key) async {
    return await _prefs!.getString(key);
  }

}