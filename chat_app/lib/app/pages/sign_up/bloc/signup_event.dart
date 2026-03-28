import 'package:chat_app/app/pages/sign_up/data/user_req_dto.dart';

abstract class SignupEvent {}

class SignupCreateUserEvent extends SignupEvent {
  final UserReqDto userReqDto;
  SignupCreateUserEvent(this.userReqDto);
}
