import "package:shared_preferences/shared_preferences.dart";
import "local_storage_controller.dart";

final class SharedPrefController implements LocalStorageController {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setData({required Keys key, required var value}) async {
    if (value is String) return await _sharedPreferences.setString(key.name, value);
    if (value is int) return await _sharedPreferences.setInt(key.name, value);
    if (value is bool) return await _sharedPreferences.setBool(key.name, value);
    if (value is double) return await _sharedPreferences.setDouble(key.name, value);
    if (value is List<String>) return await _sharedPreferences.setStringList(key.name, value);
    return false;
  }

  @override
  Object? getData({required Keys key}) {
    return _sharedPreferences.get(key.name);
  }

  @override
  Future<bool> removeData({required Keys key}) async {
    return await _sharedPreferences.remove(key.name);
  }

  @override
  bool isKeyExist({required Keys key}) {
    return _sharedPreferences.containsKey(key.name);
  }

  @override
  Future<bool> clearAllData() async {
    return await _sharedPreferences.clear();
    // for (var element in Keys.values) {
    //   if (element == Keys.isFirstTime ||
    //       element == Keys.languageCode ||
    //       element == Keys.isDarkMode) {
    //     continue;
    //   }
    //
    //   await removeData(key: element);
    // }
    // return true;
  }
}
