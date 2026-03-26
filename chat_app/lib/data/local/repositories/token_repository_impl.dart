import 'package:chat_app/data/local/shared_pref/access_local.dart';
import 'package:chat_app/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  final AccessLocal accessLocal;

  TokenRepositoryImpl({required this.accessLocal});

  @override
  Future<String?> getToken() {
    return accessLocal.getToken();
  }

  @override
  Future<void> setToken(String token) {
    return accessLocal.setToken(token);
  }
}
