import 'package:chat_app/domain/entity/src/auth_req_entity.dart';
import 'package:chat_app/domain/entity/src/auth_res_entity.dart';
import 'package:chat_app/domain/repositories/repository.dart';
import 'package:chat_app/domain/repositories/src/token_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUsecase {
  final AuthRepository authRepository;
  final TokenRepository tokenRepository;
  LoginUsecase(this.authRepository, this.tokenRepository);
  Future<AuthResEntity> loginApi(AuthReqEntity auth) async {
    final data = await authRepository.login(auth);

    /// token be trả về lưu xuống local
    if (data.token.isNotEmpty) {
      await tokenRepository.setToken(data.token);
    }
    return data;
  }

  Future<bool> isHasToken() async {
    final token = await tokenRepository.getToken();
    return token != null && token.isNotEmpty;
  }
}
