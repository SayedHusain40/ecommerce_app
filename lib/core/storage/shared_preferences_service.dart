import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;
  const SharedPreferencesService(this.sharedPreferences);

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return sharedPreferences.setString(key, value);
    if (value is bool) return sharedPreferences.setBool(key, value);
    if (value is int) return sharedPreferences.setInt(key, value);
    if (value is double) return sharedPreferences.setDouble(key, value);
    if (value is List<String>) {
      return sharedPreferences.setStringList(key, value);
    }

    return false;
  }

  String? getString({required String key}) => sharedPreferences.getString(key);

  bool? getBool({required String key}) => sharedPreferences.getBool(key);

  int? getInt({required String key}) => sharedPreferences.getInt(key);

  double? getDouble({required String key}) => sharedPreferences.getDouble(key);

  Future<bool> saveStringList({
    required String key,
    required List<String> value,
  }) => sharedPreferences.setStringList(key, value);

  List<String>? getStringList(String key) =>
      sharedPreferences.getStringList(key);

  Future<bool> removeData({required String key}) =>
      sharedPreferences.remove(key);

  Future<bool> clearData() => sharedPreferences.clear();
}
