import 'package:chat_app/domain/entity/auth_req_entity.dart';
import 'package:chat_app/domain/entity/auth_res_entity.dart';
import 'package:chat_app/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);
  Future<AuthResEntity> loginApi(AuthReqEntity auth) {
    return authRepository.login(auth);
  }
}
