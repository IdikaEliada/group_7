import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

/// Use case for updating user profile
class UpdateUserUseCase {
  final UserRepository repository;

  UpdateUserUseCase(this.repository);

  Future<UserEntity> call(UserEntity user) {
    return repository.updateUser(user);
  }
}

