import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_event.freezed.dart';

@freezed
abstract class UserInfoEvent with _$UserInfoEvent {
  const UserInfoEvent._();
  const factory UserInfoEvent.getUser() = GetUserEvent;
}
