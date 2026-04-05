import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const UserEvent._();
  const factory UserEvent.getUser() = GetUserEvent;
}
