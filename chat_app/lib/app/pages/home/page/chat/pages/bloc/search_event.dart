import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_event.freezed.dart';

@freezed
abstract class SearchEvent with _$SearchEvent {
  const SearchEvent._();
  const factory SearchEvent.search({@Default('') String search}) =
      OnSearchUserEvent;
}
