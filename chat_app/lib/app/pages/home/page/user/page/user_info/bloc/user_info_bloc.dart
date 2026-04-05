import 'package:bloc/bloc.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_event.dart';

import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_state.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/data/user_info_dto.dart';
import 'package:chat_app/domain/usecase/src/user_usecase.dart';
import 'package:chat_app/utils/core/bloc_catching.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserUsecase userUsecase;

  UserInfoBloc({required this.userUsecase}) : super(UserInfoState()) {
    on<GetUserEvent>(_getUser);
  }

  Future<void> _getUser(GetUserEvent event, Emitter<UserInfoState> emit) async {
    await blocCatching(
      execute: () async {
        emit(state.copyWith(isLoading: true));
        final data = await userUsecase.getProfile();
        emit(state.copyWith(userInfo: data.fromEntity, isLoading: false));
      },
      onError: (val) async {
        emit(state.copyWith(isLoading: false));
      },
    );
  }
}
