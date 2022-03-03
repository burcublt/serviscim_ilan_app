import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _keytoken = 'token';
  static const _keyemail = 'email';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setEmail(String username) async =>
      await _preferences?.setString(_keyemail, username);
  static Future setToken(String token) async =>
      await _preferences?.setString(_keytoken, token);

  static String? getEmail() => _preferences?.getString(_keyemail);

  static String? getToken() => _preferences?.getString(_keytoken);
}
