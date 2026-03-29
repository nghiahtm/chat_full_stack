import 'package:chat_app/domain/entity/src/user_create_req_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_req_dto.freezed.dart';

@freezed
abstract class UserReqDto with _$UserReqDto {
  const factory UserReqDto({
    required String username,
    required String password,
    required String confirmPassword,
    required String email,
    required String fullName,
  }) = _UserReqDto;
}

extension UserReqDtoMapper on UserReqDto {
  UserCreateReqEntity get toEntity => UserCreateReqEntity(
    username: username,
    password: password,
    confirmPassword: confirmPassword,
    email: email,
    fullName: fullName,
  );
}
