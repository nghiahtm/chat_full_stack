import 'package:bloc/bloc.dart';
import 'package:chat_app/app/pages/splash/bloc/splash_event.dart';
import 'package:chat_app/app/pages/splash/bloc/splash_state.dart';
import 'package:chat_app/domain/usecase/login_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LoginUsecase loginUsecase;
  SplashBloc({required this.loginUsecase}) : super(SplashState()) {
    on<SplashInitEvent>(_onSplashInitEvent);
  }

  void _onSplashInitEvent(
    SplashInitEvent event,
    Emitter<SplashState> emit,
  ) async {
    final isHasToken = await loginUsecase.isHasToken();
    emit(state.copyWith(isHasToken: isHasToken));
  }
}
