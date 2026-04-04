import 'package:chat_app/data/local/shared_pref/access_local.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthorizeInterceptor extends Interceptor {
  final AccessLocal accessLocal;

  AuthorizeInterceptor({required this.accessLocal});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await accessLocal.getToken();
    if (token != null && token.isNotEmpty) {
      // Add the Authorization header
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
