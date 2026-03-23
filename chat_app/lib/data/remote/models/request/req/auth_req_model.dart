import 'package:json_annotation/json_annotation.dart';
part 'auth_req_model.g.dart';

@JsonSerializable()
class AuthReqModel {
  final String username;
  final String password;
  AuthReqModel({required this.password, required this.username});

  factory AuthReqModel.fromJson(Map<String, dynamic> json) =>
      _$AuthReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthReqModelToJson(this);
}
