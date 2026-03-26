import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_req_entity.freezed.dart';

@freezed
abstract class AuthReqEntity with _$AuthReqEntity {
  const factory AuthReqEntity({
    required String username,
    required String password,
  }) = _AuthReqEntity;
}
