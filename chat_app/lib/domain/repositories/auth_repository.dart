import 'package:chat_app/domain/entity/auth_req_entity.dart';

abstract class AuthRepository {
  Future<void> login(AuthReqEntity authReqEntity);
}
