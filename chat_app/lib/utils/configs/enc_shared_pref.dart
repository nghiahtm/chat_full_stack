import 'package:encrypt_shared_preferences/provider.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @lazySingleton
  EncryptedSharedPreferencesAsync get prefs =>
      EncryptedSharedPreferencesAsync.getInstance();
}

@lazySingleton
class EncSharedPref {
  final EncryptedSharedPreferencesAsync sharedPreferences;

  EncSharedPref(this.sharedPreferences);

  Future<void> setString(String key, String token) {
    return sharedPreferences.setString(key, token);
  }

  Future<String?> getString(String key) {
    return sharedPreferences.getString(key);
  }

  Future<bool> remove(String key) async {
    return await sharedPreferences.remove(key);
  }

  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}
