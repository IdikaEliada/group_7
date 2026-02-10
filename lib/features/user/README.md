# User Feature - Clean Architecture

This feature follows **Feature-First Clean Architecture** principles.

## Structure

```
user/
├── domain/              # Business Logic Layer (Independent)
│   ├── entities/        # Pure business objects
│   ├── repositories/     # Repository interfaces (contracts)
│   └── usecases/         # Business logic use cases
├── data/                 # Data Layer (Depends on domain)
│   ├── models/           # Data models (with JSON serialization)
│   ├── datasources/      # Remote & Local data sources
│   └── repositories/     # Repository implementations
├── presentation/         # Presentation Layer (Depends on domain)
│   └── pages/            # UI pages/screens
└── di/                   # Dependency Injection
    └── user_dependency_injection.dart
```

## Architecture Layers

### Domain Layer (Business Logic)
- **Entities**: Pure Dart classes representing business objects
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Single-purpose business logic operations

### Data Layer
- **Models**: Extend entities with JSON serialization
- **Data Sources**: Handle API calls and local storage
- **Repository Implementations**: Implement domain repository interfaces

### Presentation Layer
- **Pages**: Flutter UI screens
- Uses use cases (not repositories directly) for business operations

## Dependency Flow

```
Presentation → Domain ← Data
     ↓           ↑
     └───────────┘
```

- Presentation depends on Domain (use cases)
- Data depends on Domain (implements repositories)
- Domain is independent (no dependencies on other layers)

## Usage Example

```dart
// Get dependencies
final userDI = UserDependencyInjection.all;

// Use in UI
UserProfilePage(
  getCurrentUserUseCase: userDI.getCurrentUserUseCase,
  updateUserUseCase: userDI.updateUserUseCase,
  updatePasswordUseCase: userDI.updatePasswordUseCase,
  logoutUseCase: userDI.logoutUseCase,
)
```

