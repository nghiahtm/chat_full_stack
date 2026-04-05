import 'package:chat_app/app/pages/home/page/user/page/user_info/data/user_info_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  factory SearchState({
    @Default(false) bool isLoading,
    @Default([]) List<UserInfoDto> searchResult,
  }) = _SearchState;
}
