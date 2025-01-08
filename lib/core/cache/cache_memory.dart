import 'package:shared_preferences/shared_preferences.dart';

class CacheMemory {
  CacheMemory._privateConstructor();

  static final CacheMemory _instance = CacheMemory._privateConstructor();

  static CacheMemory get instance => _instance;

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
