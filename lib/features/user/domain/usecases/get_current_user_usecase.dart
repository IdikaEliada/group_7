import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

/// Use case for getting the current user
class GetCurrentUserUseCase {
  final UserRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<UserEntity> call() {
    return repository.getCurrentUser();
  }
}

