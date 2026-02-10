import '../repositories/user_repository.dart';

/// Use case for logging out the user
class LogoutUseCase {
  final UserRepository repository;

  LogoutUseCase(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}

