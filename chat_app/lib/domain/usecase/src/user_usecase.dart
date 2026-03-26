import 'package:chat_app/domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserUsecase {
  final UserRepository userRepository;

  UserUsecase({required this.userRepository});

  Future<UserEntity> getProfile() async {
    return userRepository.getProfile();
  }
}
