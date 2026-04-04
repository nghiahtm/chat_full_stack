import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_req_search_model.g.dart';

@JsonSerializable()
class UserReqSearchModel {
  final String? search;
  final int? page;
  final int? limit;

  UserReqSearchModel({this.search, this.page, this.limit});

  factory UserReqSearchModel.fromJson(Map<String, Object?> json) =>
      _$UserReqSearchModelFromJson(json);
  Map<String, Object?> toJson() => _$UserReqSearchModelToJson(this);
}
