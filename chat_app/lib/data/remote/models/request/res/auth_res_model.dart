import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_res_model.g.dart';
part 'auth_res_model.freezed.dart';

@freezed
abstract class AuthResModel with _$AuthResModel {
  factory AuthResModel({required String accessToken}) = _AuthResModel;

  factory AuthResModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResModelFromJson(json);
}
