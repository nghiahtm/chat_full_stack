import 'package:chat_app/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_dto.freezed.dart';

@freezed
abstract class AuthDto with _$AuthDto {
  const factory AuthDto({required String username, required String password}) =
      _AuthDto;
}

extension MapAuthDto on AuthReqEntity {
  AuthDto get toAuthDto => AuthDto(username: username, password: password);
}

extension MapAuthReqEntity on AuthDto {
  AuthReqEntity get toAuthReqEntity =>
      AuthReqEntity(username: username, password: password);
}
