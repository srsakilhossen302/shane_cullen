import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static const String token = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String userData = "userData";
  static const String userId = "userId";

  static Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  static Future<void> setString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
