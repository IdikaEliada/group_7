import 'package:flutter/material.dart';
import 'features/user/di/user_dependency_injection.dart';
import 'features/user/presentation/pages/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get dependencies using dependency injection
    final userDI = UserDependencyInjection.all;

    return MaterialApp(
      title: 'Hostel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: UserProfilePage(
        getCurrentUserUseCase: userDI.getCurrentUserUseCase,
        logoutUseCase: userDI.logoutUseCase,
        updateUserUseCase: userDI.updateUserUseCase,
        updatePasswordUseCase: userDI.updatePasswordUseCase,
      ),
    );
  }
}
