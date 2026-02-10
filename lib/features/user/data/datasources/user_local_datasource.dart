import '../models/user_model.dart';

/// Local data source - handles local storage (SharedPreferences, Hive, etc.)
abstract class UserLocalDataSource {
  Future<UserModel?> getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearCache();
}

/// Implementation of local data source
class UserLocalDataSourceImpl implements UserLocalDataSource {
  // In a real app, this would use SharedPreferences, Hive, or similar
  UserModel? _cachedUser;

  @override
  Future<UserModel?> getCachedUser() async {
    // Simulate local storage read
    await Future.delayed(const Duration(milliseconds: 100));
    return _cachedUser;
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    // Simulate local storage write
    await Future.delayed(const Duration(milliseconds: 100));
    _cachedUser = user;
  }

  @override
  Future<void> clearCache() async {
    // Simulate clearing local storage
    await Future.delayed(const Duration(milliseconds: 100));
    _cachedUser = null;
  }
}

