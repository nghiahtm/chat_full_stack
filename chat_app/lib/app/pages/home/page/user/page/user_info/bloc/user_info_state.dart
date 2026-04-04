import 'package:chat_app/app/pages/home/page/user/page/user_info/data/user_info_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_state.freezed.dart';

@freezed
abstract class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    @Default(false) bool isLoading,
    UserInfoDto? userInfo,
  }) = _UserInfoState;
}
