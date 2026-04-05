import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState() = _UserState;
}
