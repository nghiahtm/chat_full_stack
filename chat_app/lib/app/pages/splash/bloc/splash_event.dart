import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_event.freezed.dart';

abstract class SplashEvent {}

@freezed
class SplashInitEvent extends SplashEvent with _$SplashInitEvent {
  SplashInitEvent._();
  factory SplashInitEvent() = _SplashInitEvent;
}
