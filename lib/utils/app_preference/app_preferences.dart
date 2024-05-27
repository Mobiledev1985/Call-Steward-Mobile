import 'package:get_storage/get_storage.dart';

// Use to store data in local storage
class AppPreferences {
  final userData = GetStorage();

  static final AppPreferences _singleton = AppPreferences._();

  factory AppPreferences() {
    return _singleton;
  }

  AppPreferences._();

  void sharedPrefWrite(String key, dynamic value) => userData.write(key, value);

  dynamic sharedPrefRead(String key) => userData.read(key);

  void sharedPrefRemove(String key) => userData.remove(key);

  void sharedPrefEraseAllData() => userData.erase();
}
