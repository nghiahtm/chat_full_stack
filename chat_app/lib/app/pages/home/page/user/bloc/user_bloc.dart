import 'package:chat_app/app/pages/home/page/user/bloc/user_event.dart';
import 'package:chat_app/app/pages/home/page/user/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());
}
