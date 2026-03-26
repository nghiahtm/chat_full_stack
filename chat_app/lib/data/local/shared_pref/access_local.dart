import 'package:chat_app/utils/configs/enc_shared_pref.dart';
import 'package:chat_app/utils/constant/pref_key.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AccessLocal {
  final EncSharedPref pref;
  AccessLocal(this.pref);

  Future<void> setToken(String token) {
    return pref.setString(PrefKeyConstant.kToken, token);
  }

  Future<String?> getToken() {
    return pref.getString(PrefKeyConstant.kToken);
  }
}
