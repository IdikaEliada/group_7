import '../repositories/user_repository.dart';

/// Use case for updating user password
class UpdatePasswordUseCase {
  final UserRepository repository;

  UpdatePasswordUseCase(this.repository);

  Future<void> call(String oldPassword, String newPassword) {
    return repository.updatePassword(oldPassword, newPassword);
  }
}

