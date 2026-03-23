import 'package:bloc/bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_event.dart';
import 'package:chat_app/app/pages/login/bloc/login_state.dart';
import 'package:chat_app/domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginEvent>(_onLogin);
  }

  void _onLogin(LoginEvent event, Emitter<LoginState> emit) {
    print(event);
  }
}
