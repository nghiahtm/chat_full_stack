import 'package:bloc/bloc.dart';
import 'package:chat_app/app/bloc/app_bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_event.dart';
import 'package:chat_app/app/pages/login/bloc/login_state.dart';
import 'package:chat_app/app/pages/login/data/auth_dto.dart';
import 'package:chat_app/domain/domain.dart';
import 'package:chat_app/utils/core/bloc_catching.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  final AppBloc appBloc;
  LoginBloc({required this.loginUsecase, required this.appBloc})
    : super(LoginInitial()) {
    on<GetAuthorizeEvent>(_onLogin);
    on<ObsecurePasswordEvent>(_obsecurePasswordEvent);
  }

  Future<void> _onLogin(
    GetAuthorizeEvent event,
    Emitter<LoginState> emit,
  ) async {
    await blocCatching(
      execute: () async {
        emit(LoginLoading());
        await loginUsecase.loginApi(event.authDto.toAuthReqEntity);
        emit(LoginSuccess());
      },
      onError: (e) async {
        emit(LoginFailure(message: e.message));
      },
    );
  }

  void _obsecurePasswordEvent(
    ObsecurePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(ObsecurePasswordState(obscure: !event.obscure));
  }
}
