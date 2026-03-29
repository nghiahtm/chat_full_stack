import 'package:chat_app/app/pages/login/data/auth_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event.freezed.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const LoginEvent._();
  const factory LoginEvent.getAuthorize({required AuthDto authDto}) =
      GetAuthorizeEvent;

  const factory LoginEvent.obsecurePassword({required bool obscure}) =
      ObsecurePasswordEvent;
  const factory LoginEvent.isHasText({required bool isHasText}) =
      ShowOrHideClearTextUsernameEvent;
}
