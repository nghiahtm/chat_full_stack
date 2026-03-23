import 'package:bloc/bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_event.dart';
import 'package:chat_app/app/pages/login/bloc/login_state.dart';
import 'package:chat_app/app/pages/login/data/auth_dto.dart';
import 'package:chat_app/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<GetAuthorizeEvent>(_onLogin);
    on<ObsecurePasswordEvent>(_obsecurePasswordEvent);
  }

  Future<void> _onLogin(
    GetAuthorizeEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading());
      await loginUsecase.loginApi(event.authDto.toAuthReqEntity);
      emit(LoginSuccess(token: 'token'));
    } on DioException catch (e) {
      emit(LoginFailure(message: e.message ?? 'Login failed'));
    }
  }

  void _obsecurePasswordEvent(
    ObsecurePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(ObsecurePasswordState(obscure: !event.obscure));
  }
}
