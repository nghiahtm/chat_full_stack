import '../../entity/entity.dart';

abstract class UserRepository {
  Future<UserEntity> getProfile();
  Future<List<UserEntity>?> searchingUsers({
    String search = '',
    int page = 1,
    int limit = 10,
  });
}
