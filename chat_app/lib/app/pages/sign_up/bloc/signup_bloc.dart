import 'package:chat_app/app/pages/sign_up/bloc/signup_event.dart';
import 'package:chat_app/app/pages/sign_up/bloc/signup_state.dart';
import 'package:chat_app/app/pages/sign_up/data/user_req_dto.dart';
import 'package:chat_app/domain/usecase/src/create_user_usecase.dart';
import 'package:chat_app/utils/core/bloc_catching.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final CreateUserUsecase createUserUsecase;
  SignupBloc({required this.createUserUsecase}) : super(SignupState()) {
    on<SignupCreateUserEvent>(_onCreateUser);
  }

  Future<void> _onCreateUser(
    SignupCreateUserEvent event,
    Emitter<SignupState> emit,
  ) async {
    await blocCatching(
      execute: () async {
        final isCreate = await createUserUsecase.createUserSuccessFul(
          event.userReqDto.toEntity,
        );
        emit(state.copyWith(isCreateSuccess: isCreate));
      },
    );
  }
}
