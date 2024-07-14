import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage {
  static const String theme = 'theme';
  static const String language = 'language';

  Future<void> write(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  Future<String?> read(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<void> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
