import 'package:chat_app/data/remote/api/rest_client.dart';
import 'package:chat_app/data/remote/models/request/req/auth_req_model.dart';
import 'package:chat_app/domain/entity/src/auth_req_entity.dart';
import 'package:chat_app/domain/entity/src/auth_res_entity.dart';
import 'package:chat_app/domain/repositories/src/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../utils/extensions/handle_api_ext.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  final RestClient restApi;
  AuthRepositoryImpl(@Named('DioNonAuthen') this.dio)
    : restApi = RestClient(dio);

  @override
  Future<AuthResEntity> login(AuthReqEntity authReqEntity) async {
    final res = await restApi
        .login(
          AuthReqModel(
            username: authReqEntity.username,
            password: authReqEntity.password,
          ),
        )
        .handleApi();
    return AuthResEntity(token: res.data?.accessToken ?? '');
  }
}
