import 'package:chat_app/domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserUsecase {
  final UserRepository userRepository;

  UserUsecase({required this.userRepository});

  Future<UserEntity> getProfile() {
    return userRepository.getProfile();
  }

  Future<List<UserEntity>?> searchUSer({
    String search = '',
    int page = 1,
    int limit = 10,
  }) {
    return userRepository.searchingUsers(
      search: search,
      page: page,
      limit: limit,
    );
  }
}
