import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static SharedPreferences? _prefs;

  Profile._();

  static Future<SharedPreferences> getPreferences() async {
    if (_prefs != null) {
      return _prefs!;
    } else {
      _prefs = await SharedPreferences.getInstance();

      return _prefs!;
    }
  }
}
