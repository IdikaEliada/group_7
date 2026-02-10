# Clean Architecture - Feature-First Structure

This project follows **Feature-First Clean Architecture** principles, organizing code by features with clear separation of concerns.

## Architecture Overview

```
lib/
├── features/              # Feature modules
│   ├── user/             # ✅ Implemented with Clean Architecture
│   ├── bookings/         # Placeholder
│   ├── rooms/            # Placeholder
│   ├── payments/         # Placeholder
│   ├── complaints/       # Placeholder
│   ├── admin/            # Placeholder
│   ├── notifications/    # Placeholder
│   └── auth/             # Placeholder
└── main.dart
```

## Feature Structure (Clean Architecture)

Each feature follows this structure:

```
feature_name/
├── domain/                # Business Logic Layer (Independent)
│   ├── entities/         # Pure business objects (no dependencies)
│   ├── repositories/     # Repository interfaces (contracts)
│   └── usecases/         # Business logic use cases
│
├── data/                 # Data Layer (Depends on domain)
│   ├── models/           # Data models (extend entities, add JSON)
│   ├── datasources/      # Remote & Local data sources
│   └── repositories/     # Repository implementations
│
├── presentation/         # Presentation Layer (Depends on domain)
│   ├── pages/            # UI screens/pages
│   └── widgets/          # Reusable UI widgets (optional)
│
└── di/                   # Dependency Injection
    └── feature_dependency_injection.dart
```

## Dependency Flow

```
┌─────────────┐
│ Presentation│
│   Layer     │
└──────┬──────┘
       │ depends on
       ▼
┌─────────────┐
│   Domain    │ ◄─── Independent (no external dependencies)
│   Layer     │
└──────┬──────┘
       ▲
       │ implements
┌──────┴──────┐
│  Data Layer │
└─────────────┘
```

### Rules:
1. **Domain Layer**: Pure business logic, no Flutter/framework dependencies
2. **Data Layer**: Implements domain repositories, handles API/local storage
3. **Presentation Layer**: Uses use cases (not repositories directly)
4. **Dependency Injection**: Wires everything together

## User Feature (Implemented)

The `user` feature is fully implemented following clean architecture:

### Domain Layer
- `entities/user_entity.dart` - Pure business entity
- `repositories/user_repository.dart` - Repository interface
- `usecases/` - GetCurrentUser, UpdateUser, UpdatePassword, Logout

### Data Layer
- `models/user_model.dart` - Extends entity, adds JSON serialization
- `datasources/user_remote_datasource.dart` - API calls
- `datasources/user_local_datasource.dart` - Local storage
- `repositories/user_repository_impl.dart` - Repository implementation

### Presentation Layer
- `pages/user_profile_page.dart` - User profile screen
- `pages/edit_profile_page.dart` - Edit profile screen
- `pages/user_settings_page.dart` - Settings screen

### Dependency Injection
- `di/user_dependency_injection.dart` - Wires all dependencies

## Usage Example

```dart
// In main.dart or wherever you need the feature
import 'features/user/di/user_dependency_injection.dart';
import 'features/user/presentation/pages/user_profile_page.dart';

final userDI = UserDependencyInjection.all;

UserProfilePage(
  getCurrentUserUseCase: userDI.getCurrentUserUseCase,
  updateUserUseCase: userDI.updateUserUseCase,
  updatePasswordUseCase: userDI.updatePasswordUseCase,
  logoutUseCase: userDI.logoutUseCase,
)
```

## Benefits

1. **Testability**: Each layer can be tested independently
2. **Maintainability**: Clear separation of concerns
3. **Scalability**: Easy to add new features following the same pattern
4. **Flexibility**: Can swap implementations (e.g., different data sources)
5. **Independence**: Domain layer is framework-agnostic

## Next Steps

When implementing other features, follow the same structure:
1. Define domain entities
2. Create repository interfaces
3. Implement use cases
4. Create data models and data sources
5. Implement repositories
6. Build presentation layer
7. Set up dependency injection

