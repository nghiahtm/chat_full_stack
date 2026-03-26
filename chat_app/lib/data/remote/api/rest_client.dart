import 'package:chat_app/data/remote/models/request/req/auth_req_model.dart';
import 'package:chat_app/data/remote/models/response/auth_res_model.dart';
import 'package:chat_app/data/remote/models/response/user_model.dart';
import 'package:chat_app/data/remote/models/response/base_response_model.dart';
import 'package:chat_app/utils/configs/flavor_config.dart';
import 'package:chat_app/utils/constant/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) =>
      _RestClient(dio, baseUrl: FlavorConfig.baseUrl);

  @POST(Endpoint.login)
  Future<BaseResponseModel<AuthResModel>> login(@Body() AuthReqModel auth);

  @POST(Endpoint.inforUser)
  Future<BaseResponseModel<UserModel>> getUserProfile();
}
