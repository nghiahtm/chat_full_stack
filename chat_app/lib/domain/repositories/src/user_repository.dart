import '../../entity/entity.dart';

abstract class UserRepository {
  Future<UserEntity> getProfile();
}
