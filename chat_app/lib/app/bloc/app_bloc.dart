import 'package:chat_app/app/bloc/app_event.dart';
import 'package:chat_app/app/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<ShowHiddenKeyboardEvent>(_onSetKeyBoardHidden);
  }

  void _onSetKeyBoardHidden(
    ShowHiddenKeyboardEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isHiddenKeyboard: event.isShowKeyboard));
  }
}
