import 'package:chat_app/data/remote/models/response/base_response_model.dart';
import 'package:chat_app/utils/error/app_error.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

extension HandleApiExt<T> on Future<BaseResponseModel<T>> {
  Future<BaseResponseModel<T>> handleApi() async {
    try {
      final res = await this;
      final errors = res.errors;
      if (errors.isEmpty) {
        return this;
      } else {
        Logger().e('Error: ${errors.toString()}');
        throw AppError(errors.toString());
      }
    } on DioException catch (e) {
      final message = _handleDioError(e);
      Logger().e('Error: $message');
      throw AppError(message);
    } catch (e) {
      Logger().e('Error: ${e.toString()}');
      throw AppError('Unknow Error');
    }
  }
}

String _handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timeout: Server is taking too long to respond.";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout: Server is taking too long to respond.";
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final mess = e.response?.data['message'];
      return "Error ${statusCode ?? 'Unknown'}: ${mess ?? 'No additional information'}";
    case DioExceptionType.cancel:
      return "Request was canceled.";
    case DioExceptionType.connectionError:
      return "No internet connection.";
    default:
      return "Unknown error: ${e.message}";
  }
}
