import 'package:chat_app/app/pages/home/page/chat/pages/bloc/search_event.dart';
import 'package:chat_app/app/pages/home/page/chat/pages/bloc/search_state.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/data/user_info_dto.dart';
import 'package:chat_app/domain/usecase/src/user_usecase.dart';
import 'package:chat_app/utils/core/bloc_catching.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final UserUsecase userUsecase;
  SearchBloc({required this.userUsecase}) : super(SearchState()) {
    on<OnSearchUserEvent>(_onSearchUser);
  }

  Future<void> _onSearchUser(
    OnSearchUserEvent event,
    Emitter<SearchState> emit,
  ) async {
    await blocCatching(
      execute: () async {
        emit(state.copyWith(isLoading: true));
        final res = await userUsecase.searchUSer(
          search: event.search,
          page: 1,
          limit: 10,
        );
        emit(
          state.copyWith(
            isLoading: false,
            searchResult: res?.map((e) => e.fromEntity).toList() ?? [],
          ),
        );
      },
    );
  }
}
