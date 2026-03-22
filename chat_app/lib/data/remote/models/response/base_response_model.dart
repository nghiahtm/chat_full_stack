import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> {
  final String success;
  final String message;
  final T? data;
  final int errorCode;
  final List<dynamic> errors;
  final String timestamp;

  BaseResponseModel({
    required this.success,
    required this.message,
    this.data,
    required this.errorCode,
    required this.errors,
    required this.timestamp,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}
