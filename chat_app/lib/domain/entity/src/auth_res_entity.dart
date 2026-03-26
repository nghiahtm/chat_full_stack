import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_res_entity.freezed.dart';

@freezed
abstract class AuthResEntity with _$AuthResEntity {
  factory AuthResEntity({required String token}) = _AuthResEntity;
}
