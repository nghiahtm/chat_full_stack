import 'package:chat_app/domain/domain.dart';
import 'package:chat_app/domain/entity/src/user_create_req_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateUserUsecase {
  final AuthRepository authRepository;

  CreateUserUsecase({required this.authRepository});

  Future<bool> createUserSuccessFul(UserCreateReqEntity userReq) {
    return authRepository.createUser(userReq);
  }
}
