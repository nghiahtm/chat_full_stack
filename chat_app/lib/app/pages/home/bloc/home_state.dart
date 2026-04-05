import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default(0) int selectedIndex,
  }) = _HomeState;
}
