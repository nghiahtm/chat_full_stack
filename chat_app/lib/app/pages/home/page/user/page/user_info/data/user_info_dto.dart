import 'package:chat_app/domain/entity/src/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_dto.freezed.dart';

@freezed
abstract class UserInfoDto with _$UserInfoDto {
  const factory UserInfoDto({String? fullName, String? email}) = _UserInfoDto;
}

extension MapperUserInfo on UserEntity {
  UserInfoDto get fromEntity {
    return UserInfoDto(fullName: fullName, email: email);
  }
}
