import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_create_req_model.g.dart';

@JsonSerializable()
class UserCreateReqModel {
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? email;
  final String? fullName;

  UserCreateReqModel(
    this.username,
    this.password,
    this.confirmPassword,
    this.email,
    this.fullName,
  );

  factory UserCreateReqModel.fromJson(Map<String, dynamic> json) =>
      _$UserCreateReqModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserCreateReqModelToJson(this);
}
