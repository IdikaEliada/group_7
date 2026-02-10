/// Domain entity - Pure business object without any framework dependencies
class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImageUrl;
  final String studentId;
  final String roomNumber;
  final String hostelName;
  final DateTime checkInDate;
  final DateTime? checkOutDate;
  final String emergencyContact;
  final String emergencyPhone;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImageUrl,
    required this.studentId,
    required this.roomNumber,
    required this.hostelName,
    required this.checkInDate,
    this.checkOutDate,
    required this.emergencyContact,
    required this.emergencyPhone,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? studentId,
    String? roomNumber,
    String? hostelName,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    String? emergencyContact,
    String? emergencyPhone,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      studentId: studentId ?? this.studentId,
      roomNumber: roomNumber ?? this.roomNumber,
      hostelName: hostelName ?? this.hostelName,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
    );
  }
}

