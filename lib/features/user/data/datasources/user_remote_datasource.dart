import '../models/user_model.dart';

/// Remote data source - handles API calls
abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();
  Future<UserModel> updateUser(UserModel user);
  Future<void> updatePassword(String oldPassword, String newPassword);
  Future<void> logout();
}

/// Implementation of remote data source
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserModel> getCurrentUser() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    return UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@university.edu',
      phone: '+1234567890',
      profileImageUrl: null,
      studentId: 'STU2024001',
      roomNumber: '205',
      hostelName: 'North Hostel',
      checkInDate: DateTime(2024, 1, 15),
      checkOutDate: null,
      emergencyContact: 'Jane Doe',
      emergencyPhone: '+1234567891',
    );
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return user;
  }

  @override
  Future<void> updatePassword(String oldPassword, String newPassword) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> logout() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

