abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

class ObsecurePasswordState extends LoginState {
  final bool obscure;
  ObsecurePasswordState({required this.obscure});
}
