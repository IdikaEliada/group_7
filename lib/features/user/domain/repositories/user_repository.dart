import '../entities/user_entity.dart';

/// Repository interface - defines what operations can be performed
/// Implementation will be in the data layer
abstract class UserRepository {
  /// Get the current logged-in user
  Future<UserEntity> getCurrentUser();

  /// Update user profile information
  Future<UserEntity> updateUser(UserEntity user);

  /// Update user password
  Future<void> updatePassword(String oldPassword, String newPassword);

  /// Logout the current user
  Future<void> logout();
}

