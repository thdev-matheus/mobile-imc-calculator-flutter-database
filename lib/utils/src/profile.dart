import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static SharedPreferences? _prefs;

  Profile() {
    getPreferences();
  }

  static Future<void> getPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  String? getString(String key) {
    String? value = _prefs!.getString(key);

    return value;
  }
}
