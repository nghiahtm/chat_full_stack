import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const HomeEvent._();
  const factory HomeEvent.init() = InitEvent;
  const factory HomeEvent.onChangeTab({@Default(0) int index}) =
      OnChangeTabEvent;
}
