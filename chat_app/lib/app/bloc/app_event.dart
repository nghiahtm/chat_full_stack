import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_event.freezed.dart';

abstract class AppEvent {}

@freezed
abstract class ShowHiddenKeyboardEvent extends AppEvent
    with _$ShowHiddenKeyboardEvent {
  ShowHiddenKeyboardEvent._();
  factory ShowHiddenKeyboardEvent({@Default(false) bool isShowKeyboard}) =
      _ShowHiddenKeyboardEvent;
}
