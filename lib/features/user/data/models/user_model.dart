import '../../domain/entities/user_entity.dart';

/// Data model - extends entity with JSON serialization
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    super.profileImageUrl,
    required super.studentId,
    required super.roomNumber,
    required super.hostelName,
    required super.checkInDate,
    super.checkOutDate,
    required super.emergencyContact,
    required super.emergencyPhone,
  });

  /// Convert entity to model
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      profileImageUrl: entity.profileImageUrl,
      studentId: entity.studentId,
      roomNumber: entity.roomNumber,
      hostelName: entity.hostelName,
      checkInDate: entity.checkInDate,
      checkOutDate: entity.checkOutDate,
      emergencyContact: entity.emergencyContact,
      emergencyPhone: entity.emergencyPhone,
    );
  }

  /// Convert model to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      profileImageUrl: profileImageUrl,
      studentId: studentId,
      roomNumber: roomNumber,
      hostelName: hostelName,
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      emergencyContact: emergencyContact,
      emergencyPhone: emergencyPhone,
    );
  }

  /// JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'studentId': studentId,
      'roomNumber': roomNumber,
      'hostelName': hostelName,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate?.toIso8601String(),
      'emergencyContact': emergencyContact,
      'emergencyPhone': emergencyPhone,
    };
  }

  /// JSON deserialization
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      studentId: json['studentId'] as String,
      roomNumber: json['roomNumber'] as String,
      hostelName: json['hostelName'] as String,
      checkInDate: DateTime.parse(json['checkInDate'] as String),
      checkOutDate: json['checkOutDate'] != null
          ? DateTime.parse(json['checkOutDate'] as String)
          : null,
      emergencyContact: json['emergencyContact'] as String,
      emergencyPhone: json['emergencyPhone'] as String,
    );
  }

  @override
  UserModel copyWith({
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
    return UserModel(
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

