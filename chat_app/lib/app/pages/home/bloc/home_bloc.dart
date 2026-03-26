import 'package:chat_app/app/pages/home/bloc/home_event.dart';
import 'package:chat_app/app/pages/home/bloc/home_state.dart';
import 'package:chat_app/domain/usecase/src/user_usecase.dart';
import 'package:chat_app/utils/core/bloc_catching.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserUsecase userUsecase;

  HomeBloc({required this.userUsecase}) : super(HomeState()) {
    on<InitEvent>(onGetUser);
  }

  Future<void> onGetUser(InitEvent event, Emitter<HomeState> emit) async {
    blocCatching(
      execute: () async {
        final user = await userUsecase.getProfile();
        print(user);
      },
    );
  }
}
