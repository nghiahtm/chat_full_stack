import 'package:chat_app/data/remote/api/rest_client.dart';
import 'package:chat_app/data/remote/models/request/req/user_req_search_model.dart';
import 'package:chat_app/utils/extensions/handle_api_ext.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final Dio dio;
  final RestClient restApi;
  UserRepositoryImpl(@Named('Authorization') this.dio)
    : restApi = RestClient(dio);
  @override
  Future<UserEntity> getProfile() async {
    final res = await restApi.getUserProfile().handleApi();
    final data = res.data;
    return UserEntity(
      id: data?.id,
      username: data?.username,
      email: data?.email,
      fullName: data?.fullName,
    );
  }

  @override
  Future<List<UserEntity>?> searchingUsers({
    String search = '',
    int page = 1,
    int limit = 10,
  }) async {
    final res = await restApi
        .searchUser(
          UserReqSearchModel(search: search, page: page, limit: limit),
        )
        .handleApi();
    final data = res.data;
    return data?.docs
        .map(
          (e) => UserEntity(
            id: e.id,
            username: e.username,
            email: e.email,
            fullName: e.fullName,
          ),
        )
        .toList();
  }
}
