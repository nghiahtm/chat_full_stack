import 'package:chat_app/data/remote/api/rest_client.dart';
import 'package:chat_app/data/remote/models/request/req/auth_req_model.dart';
import 'package:chat_app/domain/entity/auth_req_entity.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  final RestClient restApi;
  AuthRepositoryImpl(@Named('TimeoutDio') this.dio) : restApi = RestClient(dio);

  @override
  Future<void> login(AuthReqEntity authReqEntity) {
    return restApi.login(
      AuthReqModel(
        username: authReqEntity.username,
        password: authReqEntity.password,
      ),
    );
  }
}
