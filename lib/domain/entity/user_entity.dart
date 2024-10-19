import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';

class UserEntity {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final String phone;
  final String? photoUrl;
  final bool isAdmin;
  final List<TripEntity> bags;

  UserEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
    this.photoUrl,
    this.isAdmin = false,
    List<TripEntity>? bags,
  }) : bags = bags ?? [];

  UserEntity copyWith({
    String? id,
    String? email,
    String? password,
    String? fullName,
    String? phone,
    String? photoUrl,
    bool? isAdmin,
    List<TripEntity>? bags,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      isAdmin: isAdmin ?? this.isAdmin,
      bags: bags ?? this.bags,
    );
  }
}
