import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

/// Repository implementation - coordinates between data sources
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<UserEntity> getCurrentUser() async {
    try {
      // Try to get from cache first
      final cachedUser = await localDataSource.getCachedUser();
      if (cachedUser != null) {
        return cachedUser.toEntity();
      }

      // If not in cache, fetch from remote
      final userModel = await remoteDataSource.getCurrentUser();
      
      // Cache the user for future use
      await localDataSource.cacheUser(userModel);
      
      return userModel.toEntity();
    } catch (e) {
      // Handle error - could throw custom exceptions
      rethrow;
    }
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      final updatedModel = await remoteDataSource.updateUser(userModel);
      
      // Update cache
      await localDataSource.cacheUser(updatedModel);
      
      return updatedModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String oldPassword, String newPassword) async {
    try {
      await remoteDataSource.updatePassword(oldPassword, newPassword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearCache();
    } catch (e) {
      rethrow;
    }
  }
}

