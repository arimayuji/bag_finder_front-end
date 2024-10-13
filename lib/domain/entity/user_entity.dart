import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';

class UserEntity {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final String? photoUrl;
  final bool isAdmin;
  final List<TripEntity> bags = [];

  UserEntity({
    required this.photoUrl,
    required this.phone,
    required this.isAdmin,
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });
}
