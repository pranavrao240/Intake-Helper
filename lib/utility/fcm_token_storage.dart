import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _key = 'fcm_token';

  static Future<String?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }
}
