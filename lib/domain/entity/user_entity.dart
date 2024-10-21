import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_avatar_entity.dart';
import 'package:bag_finder_frontend/domain/enums/user_gender_enum.dart';

class UserEntity {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final UserGenderEnum gender;
  final String phone;
  final UserAvatarEntity? avatar;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<TripEntity> bags;

  UserEntity({
    required this.id,
    required this.gender,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
    this.avatar,
    this.isAdmin = false,
    DateTime? createdAt,
    this.updatedAt,
    List<TripEntity>? bags,
  })  : createdAt = createdAt ?? DateTime.now(),
        bags = bags ?? [];

  UserEntity copyWith({
    String? id,
    String? email,
    String? password,
    String? fullName,
    String? phone,
    UserAvatarEntity? avatar,
    bool? isAdmin,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserGenderEnum? gender,
    List<TripEntity>? bags,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      isAdmin: isAdmin ?? this.isAdmin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bags: bags ?? this.bags,
      gender: gender ?? this.gender,
    );
  }

  static UserEntity empty() {
    return UserEntity(
      id: '',
      email: '',
      password: '',
      fullName: '',
      phone: '',
      avatar: UserAvatarEntity.empty(),
      isAdmin: false,
      createdAt: DateTime.now(),
      updatedAt: null,
      bags: [],
      gender: UserGenderEnum.OTHER,
    );
  }
}
