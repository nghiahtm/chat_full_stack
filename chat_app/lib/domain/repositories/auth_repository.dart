import 'package:chat_app/domain/entity/auth_req_entity.dart';
import 'package:chat_app/domain/entity/auth_res_entity.dart';

abstract class AuthRepository {
  Future<AuthResEntity> login(AuthReqEntity authReqEntity);
}
