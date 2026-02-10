import '../data/datasources/user_local_datasource.dart';
import '../data/datasources/user_remote_datasource.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/usecases/get_current_user_usecase.dart';
import '../domain/usecases/update_user_usecase.dart';
import '../domain/usecases/update_password_usecase.dart';
import '../domain/usecases/logout_usecase.dart';

/// Dependency Injection setup for User feature
/// In a production app, you might use a DI package like get_it or injectable

class UserDependencyInjection {
  // Data Sources
  static UserRemoteDataSource get _remoteDataSource =>
      UserRemoteDataSourceImpl();
  static UserLocalDataSource get _localDataSource => UserLocalDataSourceImpl();

  // Repository
  static UserRepository get _repository => UserRepositoryImpl(
        remoteDataSource: _remoteDataSource,
        localDataSource: _localDataSource,
      );

  // Use Cases
  static GetCurrentUserUseCase get getCurrentUserUseCase =>
      GetCurrentUserUseCase(_repository);
  static UpdateUserUseCase get updateUserUseCase =>
      UpdateUserUseCase(_repository);
  static UpdatePasswordUseCase get updatePasswordUseCase =>
      UpdatePasswordUseCase(_repository);
  static LogoutUseCase get logoutUseCase => LogoutUseCase(_repository);

  /// Get all dependencies at once
  static ({
    GetCurrentUserUseCase getCurrentUserUseCase,
    UpdateUserUseCase updateUserUseCase,
    UpdatePasswordUseCase updatePasswordUseCase,
    LogoutUseCase logoutUseCase,
  }) get all => (
        getCurrentUserUseCase: getCurrentUserUseCase,
        updateUserUseCase: updateUserUseCase,
        updatePasswordUseCase: updatePasswordUseCase,
        logoutUseCase: logoutUseCase,
      );
}

