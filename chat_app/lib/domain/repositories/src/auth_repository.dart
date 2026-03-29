import 'package:chat_app/domain/entity/src/auth_req_entity.dart';
import 'package:chat_app/domain/entity/src/auth_res_entity.dart';
import 'package:chat_app/domain/entity/src/user_create_req_entity.dart';

abstract class AuthRepository {
  Future<AuthResEntity> login(AuthReqEntity authReqEntity);
  Future<bool> createUser(UserCreateReqEntity userReq);
}
