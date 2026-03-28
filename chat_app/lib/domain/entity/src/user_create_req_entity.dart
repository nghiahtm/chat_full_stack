import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_create_req_entity.freezed.dart';

@freezed
abstract class UserCreateReqEntity with _$UserCreateReqEntity {
  const factory UserCreateReqEntity({
    required String username,
    required String password,
    required String confirmPassword,
    required String email,
    required String fullName,
  }) = _UserCreateReqEntity;
}
